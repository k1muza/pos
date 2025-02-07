import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class IPurchaseLineItemRepository {
  Future<List<PurchaseLineItem>> getAllPurchaseLineItems();
  Future<PurchaseLineItem?> getPurchaseLineItemById(int purchaselineitemId);
  Future<List<PurchaseLineItem?>> getPurchaseLineItemByPurchaseId(int purchaseId);
  Future<bool> updatePurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem);
  Future<void> addPurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem);
  Stream<List<PurchaseLineItem>> watchAllPurchaseLineItems();
  Future<int> deletePurchaseLineItem(int id);
}
