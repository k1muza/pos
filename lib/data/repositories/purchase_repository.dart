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
  Future<List<Purchase>> getAllPurchases() => purchaseLocalDataSource.getAllPurchases();

  @override
  Future<Purchase?> getPurchaseById(String purchaseId) =>
      purchaseLocalDataSource.getPurchaseById(purchaseId);

  @override
  Stream<Purchase?> watchPurchaseById(String purchaseId) =>
      purchaseLocalDataSource.watchPurchaseById(purchaseId);

  @override
  Future<bool> updatePurchase(PurchasesCompanion purchase) =>
      purchaseLocalDataSource.updatePurchase(purchase);

  @override
  Future<int> addPurchase(Purchase purchase) =>
      purchaseLocalDataSource.addPurchase(purchase);

  @override
  Stream<List<Purchase>> watchAllPurchases() {
    Stream<List<Purchase>> stream = purchaseLocalDataSource.watchAllPurchases();

    // Trigger a remote fetch in parallel (fire-and-forget)
    purchaseRemoteDataSource.fetchAllPurchases().then((remotePurchases) async {
      // Optionally, check for duplicates or merge changes.
      for (final purchase in remotePurchases) {
        await purchaseLocalDataSource.addPurchase(purchase);
      }
    }).catchError((error) {
      // Handle errors if needed.
      print("Remote fetch error: $error");
    });

    return stream;
  }

  @override
  Future<int> deletePurchase(String id) => purchaseLocalDataSource.deletePurchase(id);
}
