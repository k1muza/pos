import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';
import '../../domain/models/product.dart';
import 'app_database.dart';

part 'sale_line_item_dao.g.dart';

@DriftAccessor(tables: [SaleLineItems])
class SaleLineItemDao extends DatabaseAccessor<AppDatabase>
    with _$SaleLineItemDaoMixin {
  final AppDatabase db;

  SaleLineItemDao(this.db) : super(db);

  // Get all salelineitems
  Future<List<SaleLineItem>> getAllSaleLineItems() =>
      select(saleLineItems).get();

  // Stream of all salelineitems (for reactive UI)
  Stream<List<SaleLineItem>> watchAllSaleLineItems() =>
      select(saleLineItems).watch();

  // Insert a salelineitem
  Future<int> insertSaleLineItem(SaleLineItemsCompanion salelineitem) {
    return into(saleLineItems)
        .insert(salelineitem, mode: InsertMode.insertOrReplace);
  }

  // Update a salelineitem
  Future<bool> updateSaleLineItemData(Insertable<SaleLineItem> salelineitem) {
    return update(saleLineItems).replace(salelineitem);
  }

  // Delete a salelineitem
  Future<int> deleteSaleLineItem(String id) {
    return (delete(saleLineItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<SaleLineItem?> getSaleLineItemById(String id) {
    return (select(saleLineItems)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<List<SaleLineItem>> watchSaleLineItemBySaleId(String id) {
    final query = select(saleLineItems).join([
      innerJoin(sales, sales.id.equalsExp(saleLineItems.saleId)),
      innerJoin(products, products.id.equalsExp(saleLineItems.productId))
    ])
      ..where((saleLineItems.saleId.equals(id)));

    return query.watch().map((rows) => rows
        .map((row) => SaleLineItem(
              id: row.read<String>(saleLineItems.id) ?? '',
              createdAt:
                  row.read<DateTime>(saleLineItems.createdAt) ?? DateTime.now(),
              productId: row.read<String>(saleLineItems.productId) ?? '',
              saleId: row.read<String>(saleLineItems.saleId) ?? '',
              quantity: row.read<double>(saleLineItems.quantity) ?? 0,
              totalPrice: row.read<double>(saleLineItems.totalPrice) ?? 0,
              unitPrice: row.read<double>(saleLineItems.unitPrice) ?? 0,
              product: Product(
                id: row.read<String>(products.id) ?? '',
                name: row.read<String>(products.name) ?? '',
                unitPrice: row.read<double>(products.unitPrice) ?? 0,
                unit: row.read<String>(products.unit) ?? '',
                isWeightBased: row.read<bool>(products.isWeightBased) ?? false,
                isActive: row.read<bool>(products.isActive) ?? false,
                supplierId: row.read<String>(products.supplierId) ?? '',
                createdAt:
                    row.read<DateTime>(products.createdAt) ?? DateTime.now(),
              ),
            ))
        .toList());
  }

  Future<List<SaleLineItem>> getSaleLineItemBySaleId(String id) {
    return (select(saleLineItems)..where((tbl) => tbl.saleId.equals(id))).get();
  }
}
