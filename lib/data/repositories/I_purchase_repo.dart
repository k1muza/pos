import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

abstract class IPurchaseRepository {
  Future<List<Purchase>> getAllPurchases();
  Future<Purchase?> getPurchaseById(String purchaseId);
  Future<bool> updatePurchase(PurchasesCompanion purchase);
  Future<int> addPurchase(Purchase purchase);
  Stream<List<Purchase>> watchAllPurchases();
  Stream<Purchase?> watchPurchaseById(String purchaseId);
  Future<int> deletePurchase(String id);
}
