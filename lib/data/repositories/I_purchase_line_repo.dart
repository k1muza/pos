import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';

abstract class IPurchaseLineItemRepository {
  Future<List<PurchaseLineItem>> getAllPurchaseLineItems();
  Future<PurchaseLineItem?> getPurchaseLineItemById(String purchaselineitemId);
  Future<List<PurchaseLineItem?>> getPurchaseLineItemByPurchaseId(String purchaseId);
  Future<bool> updatePurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem);
  Future<int> addPurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem);
  Stream<List<PurchaseLineItem>> watchAllPurchaseLineItems();
  Future<int> deletePurchaseLineItem(String id);
}
