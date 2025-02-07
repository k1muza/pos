import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

abstract class IPurchaseRepository {
  Future<List<Purchase>> getAllPurchases();
  Future<Purchase?> getPurchaseById(int purchaseId);
  Future<bool> updatePurchase(PurchasesCompanion purchase);
  Future<void> addPurchase(PurchasesCompanion purchase);
  Stream<List<Purchase>> watchAllPurchases();
  Future<int> deletePurchase(int id);
}
