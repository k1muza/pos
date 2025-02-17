import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';
import '../../domain/models/product.dart';
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

  Stream<List<PurchaseLineItem>> watchPurchaseLineItemsByPurchaseId(String id) {
    final query = select(purchaseLineItems)
      .join([
        innerJoin(purchases, purchases.id.equalsExp(purchaseLineItems.purchaseId)),
        innerJoin(products, products.id.equalsExp(purchaseLineItems.productId))
      ])
      ..where((purchaseLineItems.purchaseId.equals(id)));

    return query.watch().map((rows) {
      return rows.map((row) {
        return PurchaseLineItem(
          id: row.read<String>(purchaseLineItems.id) ?? '',
          purchaseId: row.read<String>(purchaseLineItems.purchaseId) ?? '',
          productId: row.read<String>(purchaseLineItems.productId) ?? '',
          quantity: row.read<double>(purchaseLineItems.quantity) ?? 0,
          createdAt: row.read<DateTime>(purchaseLineItems.createdAt) ?? DateTime.now(),
          totalCost: row.read<double>(purchaseLineItems.totalCost) ?? 0,
          unitCost: row.read<double>(purchaseLineItems.unitCost) ?? 0,
          product: Product(
            id: row.read<String>(products.id) ?? '',
            name: row.read<String>(products.name) ?? '',
            unitPrice: row.read<double>(products.unitPrice) ?? 0,
            unit: row.read<String>(products.unit) ?? '',
            isWeightBased: row.read<bool>(products.isWeightBased) ?? false,
            isActive: row.read<bool>(products.isActive) ?? false,
            supplierId: row.read<String>(products.supplierId) ?? '',
            createdAt: row.read<DateTime>(products.createdAt) ?? DateTime.now(),
          ),
        );
      }).toList();
    });
  }

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
