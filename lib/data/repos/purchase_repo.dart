import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/purchase_dao.dart';
import 'package:pos_meat_shop/data/database/purchase_line_item_dao.dart';
import 'package:pos_meat_shop/data/repos/I_purchase_repo.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

class PurchaseRepository implements IPurchaseRepository {
  final PurchaseDao _purchaseDao;
  final PurchaseLineItemDao _purchaseLineItemDao;

  PurchaseRepository(this._purchaseDao, this._purchaseLineItemDao);

  @override
  Future<List<Purchase>> getAllPurchases() async {
    final purchases = await _purchaseDao.getAllPurchases();
    for (final purchase in purchases) {
      purchase.lineItems = await _purchaseLineItemDao
          .getPurchaseLineItemsByPurchaseId(purchase.id);
    }
    return purchases;
  }

  @override
  Future<Purchase?> getPurchaseById(int purchaseId) =>
      _purchaseDao.getPurchaseById(purchaseId);

  @override
  Future<bool> updatePurchase(PurchasesCompanion purchase) =>
      _purchaseDao.updatePurchaseData(purchase);

  @override
  Future<void> addPurchase(PurchasesCompanion purchase) =>
      _purchaseDao.insertPurchase(purchase);

  @override
  Stream<List<Purchase>> watchAllPurchases() =>
      _purchaseDao.watchAllPurchases();

  @override
  Future<int> deletePurchase(int id) => _purchaseDao.deletePurchase(id);
}
