import 'package:drift/drift.dart';
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
  Future<void> insertSaleLineItem(SaleLineItemsCompanion salelineitem) {
    return into(saleLineItems)
        .insert(salelineitem, mode: InsertMode.insertOrReplace);
  }

  // Update a salelineitem
  Future<bool> updateSaleLineItemData(Insertable<SaleLineItem> salelineitem) {
    return update(saleLineItems).replace(salelineitem);
  }

  // Delete a salelineitem
  Future<int> deleteSaleLineItem(int id) {
    return (delete(saleLineItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<SaleLineItem?> getSaleLineItemById(int id) {
    return (select(saleLineItems)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<SaleLineItem>> getSaleLineItemBySaleId(int id) {
    return (select(saleLineItems)..where((tbl) => tbl.saleId.equals(id))).get();
  }
}
