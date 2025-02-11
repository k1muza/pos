import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';
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


  Stream<List<PurchaseLineItem>> watchPurchaseLineItemsByPurchaseId(String id) =>
      (select(purchaseLineItems)..where((tbl) => tbl.purchaseId.equals(id))).watch();

  Future<List<PurchaseLineItem>> getPurchaseLineItemsByPurchaseId(String id) =>
      (select(purchaseLineItems)..where((tbl) => tbl.purchaseId.equals(id))).get();

  // Insert a purchaselineitem
  Future<int> insertPurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem) {
    return into(purchaseLineItems)
        .insert(purchaselineitem, mode: InsertMode.insertOrReplace);
  }

  // Update a purchaselineitem
  Future<bool> updatePurchaseLineItemData(Insertable<PurchaseLineItem> purchaselineitem) {
    return update(purchaseLineItems).replace(purchaselineitem);
  }

  // Delete a purchaselineitem
  Future<int> deletePurchaseLineItem(String id) {
    return (delete(purchaseLineItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<PurchaseLineItem?> getPurchaseLineItemById(String id) {
    return (select(purchaseLineItems)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<PurchaseLineItem>> getPurchaseLineItemByPurchaseId(String id) {
    return (select(purchaseLineItems)..where((tbl) => tbl.purchaseId.equals(id))).get();
  }
}
