import 'package:drift/drift.dart';
import 'app_database.dart';

part 'purchase_line_item_dao.g.dart';

@DriftAccessor(tables: [PurchaseLineItems])
class PurchaseLineItemDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseLineItemDaoMixin {
  final AppDatabase db;

  PurchaseLineItemDao(this.db) : super(db);

  // Get all purchaselineitems
  Future<List<PurchaseLineItem>> getAllPurchaseLineItems() =>
      select(purchaseLineItems).get();

  // Stream of all purchaselineitems (for reactive UI)
  Stream<List<PurchaseLineItem>> watchAllPurchaseLineItems() =>
      select(purchaseLineItems).watch();


  Stream<List<PurchaseLineItem>> watchPurchaseLineItemsByPurchaseId(int id) =>
      (select(purchaseLineItems)..where((tbl) => tbl.purchaseId.equals(id))).watch();

  Future<List<PurchaseLineItem>> getPurchaseLineItemsByPurchaseId(int id) =>
      (select(purchaseLineItems)..where((tbl) => tbl.purchaseId.equals(id))).get();

  // Insert a purchaselineitem
  Future<void> insertPurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem) {
    return into(purchaseLineItems)
        .insert(purchaselineitem, mode: InsertMode.insertOrReplace);
  }

  // Update a purchaselineitem
  Future<bool> updatePurchaseLineItemData(Insertable<PurchaseLineItem> purchaselineitem) {
    return update(purchaseLineItems).replace(purchaselineitem);
  }

  // Delete a purchaselineitem
  Future<int> deletePurchaseLineItem(int id) {
    return (delete(purchaseLineItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<PurchaseLineItem?> getPurchaseLineItemById(int id) {
    return (select(purchaseLineItems)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<PurchaseLineItem>> getPurchaseLineItemByPurchaseId(int id) {
    return (select(purchaseLineItems)..where((tbl) => tbl.purchaseId.equals(id))).get();
  }
}
