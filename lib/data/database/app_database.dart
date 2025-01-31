import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

// Include generated file
part 'app_database.g.dart';

mixin TableMixin on Table {
  // Primary key column
  late final id = integer().autoIncrement()();

  // Column for created at timestamp
  late final createdAt = dateTime().withDefault(currentDateAndTime)();

  // Remote ID
  late final remoteId = text().nullable()(); 
}

class Suppliers extends Table with TableMixin {
  late final name = text().withLength(min: 1, max: 250)();
}
class Products extends Table with TableMixin {
  late final name = text().withLength(min: 1, max: 250)();
  late final unitPrice = real()();
  late final unit = text()();
  late final isWeightBased = boolean().generatedAs(unit.equals('kg'))();
  late final isActive = boolean().withDefault(Constant(true))();
  late final supplierId = integer().references(Suppliers, #id).nullable()();
}

class Sales extends Table with TableMixin {
  late final notes = text().nullable()();
}

class SaleLineItems extends Table with TableMixin {
  late final productId = integer().references(Products, #id)();
  late final saleId = integer().references(Sales, #id)();
  late final Column<double> quantity =
      real().check(quantity.isBiggerThanValue(0))();
  late final totalPrice = real()();
  late final unitPrice = real().generatedAs(totalPrice/quantity)();
}

class Purchases extends Table with TableMixin{
  late final notes = text().nullable()();
}

class PurchaseLineItems extends Table with TableMixin {
  late final productId = integer().references(Products, #id)();
  late final purchaseId = integer().references(Purchases, #id)();
  late final Column<double> quantity =
      real().check(quantity.isBiggerThanValue(0))();
  late final totalCost = real()();
  late final unitCost = real().generatedAs(totalCost/quantity)();
}

class StockConversions extends Table with TableMixin {
  late final fromBatchId = integer().references(Batches, #id)();
  late final toBatchId = integer().references(Batches, #id)();
  late final Column<double> quantity =
      real().check(quantity.isBiggerThanValue(0))();
}

class StockAdjustments extends Table with TableMixin {
  late final batchId = integer().references(Batches, #id)();
  late final quantity = real()();
}

class Batches extends Table with TableMixin {
  late final productId = integer().references(Products, #id)();
  late final totalCost = real().nullable()();
  late final referenceType = text()();
  late final referenceId = integer()();
}

class BatchMovements extends Table with TableMixin {
  late final batchId = integer().references(Batches, #id)();
  late final unitPrice = real().nullable()();
  late final quantity = real()(); // neg or positive
  late final referenceType = text()();
  late final referenceId = integer()();
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
  Batches,
  BatchMovements,
])
class AppDatabase extends _$AppDatabase {
  // Specify the location of the database file
  AppDatabase() : super(_openConnection());

  // Bump this number when changing tables and columns
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
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
