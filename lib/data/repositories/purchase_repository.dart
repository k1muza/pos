import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/local/purchase_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/purchase_datasource.dart';
import 'package:pos_meat_shop/data/repositories/I_purchase_repo.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

class PurchaseRepository implements IPurchaseRepository {
  final PurchaseLocalDataSource purchaseLocalDataSource;
  final PurchaseRemoteDatasource purchaseRemoteDataSource;

  PurchaseRepository(this.purchaseLocalDataSource, this.purchaseRemoteDataSource);

  @override
  Future<List<Purchase>> getAllPurchases() async {
    var purchases = await purchaseLocalDataSource.getAllPurchases();

    if (purchases.isNotEmpty) {
      return purchases;
    }

    purchases = await purchaseRemoteDataSource.fetchAllPurchases();

    for (final purchase in purchases) {
      await purchaseLocalDataSource.addPurchase(purchase);
    }

    return await purchaseLocalDataSource.getAllPurchases();
  }

  @override
  Future<Purchase?> getPurchaseById(String purchaseId) =>
      purchaseLocalDataSource.getPurchaseById(purchaseId);

  @override
  Future<bool> updatePurchase(PurchasesCompanion purchase) =>
      purchaseLocalDataSource.updatePurchase(purchase);

  @override
  Future<int> addPurchase(Purchase purchase) =>
      purchaseLocalDataSource.addPurchase(purchase);

  @override
  Stream<List<Purchase>> watchAllPurchases() =>
      purchaseLocalDataSource.watchAllPurchases();

  @override
  Future<int> deletePurchase(String id) => purchaseLocalDataSource.deletePurchase(id);
}
