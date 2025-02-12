import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'package:pos_meat_shop/domain/models/product.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';
import 'package:pos_meat_shop/domain/models/supplier.dart';

// Include generated file
part 'app_database.g.dart';

mixin TableMixin on Table {
  // Primary key column
  late final id = text().unique()();

  // Column for created at timestamp
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().nullable()();
}

@UseRowClass(Supplier)
class Suppliers extends Table with TableMixin {
  late final name = text().withLength(min: 1, max: 250)();
}

@UseRowClass(Product)
class Products extends Table with TableMixin {
  late final name = text().withLength(min: 1, max: 250)();
  late final unitPrice = real()();
  late final unit = text()();
  late final isWeightBased = boolean().generatedAs(unit.equals('kg'))();
  late final isActive = boolean().withDefault(Constant(true))();
  late final supplierId = text().references(Suppliers, #id).nullable()();
}

class Sales extends Table with TableMixin {
  late final notes = text().nullable()();
  late final date = dateTime()();
}

class SaleLineItems extends Table with TableMixin {
  late final productId = text().references(Products, #id)();
  late final saleId = text().references(Sales, #id)();
  late final Column<double> quantity =
      real().check(quantity.isBiggerThanValue(0))();
  late final totalPrice = real()();
  late final unitPrice = real().generatedAs(totalPrice / quantity)();
}

@UseRowClass(Purchase)
class Purchases extends Table with TableMixin {
  late final notes = text().nullable()();
  late final date = dateTime()();
}

@UseRowClass(PurchaseLineItem)
class PurchaseLineItems extends Table with TableMixin {
  late final productId = text().references(Products, #id)();
  late final purchaseId = text().references(Purchases, #id)();
  late final Column<double> quantity =
      real().check(quantity.isBiggerThanValue(0))();
  late final totalCost = real()();
  late final unitCost = real().generatedAs(totalCost / quantity)();
}

class StockConversions extends Table with TableMixin {
  late final fromProductId = text().references(Products, #id)();
  late final toProductId = text().references(Products, #id)();
  late final Column<double> quantity =
      real().check(quantity.isBiggerThanValue(0))();
  late final date = dateTime()();
}

class StockAdjustments extends Table with TableMixin {
  late final productId = text().references(Products, #id)();
  late final quantity = real()();
  late final date = dateTime()();
}

class StockMovements extends Table {
  late final id = integer().autoIncrement()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final productId = text().references(Products, #id)();
  late final quantity = real()();
  late final referenceType = text()();
  late final referenceId = text()();
  late final date = dateTime()();
}

// Define the AppDatabase
@DriftDatabase(tables: [
  Suppliers,
  Products,
  Sales,
  SaleLineItems,
  Purchases,
  PurchaseLineItems,
  StockConversions,
  StockAdjustments,
  StockMovements,
])
class AppDatabase extends _$AppDatabase {
  // Specify the location of the database file
  AppDatabase() : super(_openConnection());

  // Create Singleton instance
  static AppDatabase? _instance;

  factory AppDatabase.getInstance() {
    _instance ??= AppDatabase();
    return _instance!;
  }

  // Bump this number when changing tables and columns
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await customStatement('''
            CREATE TRIGGER IF NOT EXISTS stock_movement_on_sale
            AFTER INSERT ON sale_line_items
            FOR EACH ROW
            BEGIN
              INSERT INTO stock_movements (product_id, quantity, reference_type, reference_id, date)
              VALUES (NEW.product_id, -NEW.quantity, 'sale', NEW.id, (SELECT date FROM sales WHERE id = NEW.sale_id));
            END
          ''');
          await customStatement('''
            CREATE TRIGGER IF NOT EXISTS stock_movement_on_purchase
            AFTER INSERT ON purchase_line_items
            FOR EACH ROW
            BEGIN
              INSERT INTO stock_movements (product_id, quantity, reference_type, reference_id, date)
              VALUES (NEW.product_id, NEW.quantity, 'purchase', NEW.id, (SELECT date FROM purchases WHERE id = NEW.purchase_id));
            END
          ''');
          await customStatement('''
            CREATE TRIGGER IF NOT EXISTS stock_movement_on_stock_conversion
            AFTER INSERT ON stock_conversions
            FOR EACH ROW
            BEGIN
              INSERT INTO stock_movements (product_id, quantity, reference_type, reference_id, date)
              VALUES (NEW.from_product_id, -NEW.quantity, 'conversion', NEW.id, NEW.date);
              INSERT INTO stock_movements (product_id, quantity, reference_type, reference_id, date)
              VALUES (NEW.to_product_id, NEW.quantity, 'conversion', NEW.id, NEW.date);
            END
          ''');
          await customStatement('''
            CREATE TRIGGER IF NOT EXISTS stock_movement_on_stock_adjustment
            AFTER INSERT ON stock_adjustments
            FOR EACH ROW
            BEGIN
              INSERT INTO stock_movements (product_id, quantity, reference_type, reference_id, date)
              VALUES (NEW.product_id, NEW.quantity, 'adjustment', NEW.id, NEW.date);
            END
          ''');
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Handle migrations here
          // Example for future migrations:
          // if (from < 2) {
          //   await m.addColumn(products, products.createdAt);
          //   await customStatement(
          //     '''
          //     UPDATE products
          //     SET created_at = CURRENT_TIMESTAMP
          //     WHERE created_at IS NULL
          //     '''
          //   );
          // }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
