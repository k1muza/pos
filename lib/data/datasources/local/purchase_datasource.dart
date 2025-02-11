import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/purchase_dao.dart';
import 'package:pos_meat_shop/data/database/purchase_line_item_dao.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';
import 'package:rxdart/rxdart.dart';

class PurchaseLocalDataSource {
  final PurchaseDao _purchaseDao;
  final PurchaseLineItemDao _purchaseLineItemDao;

  PurchaseLocalDataSource(this._purchaseDao, this._purchaseLineItemDao);

  Future<List<Purchase>> getAllPurchases() async {
    var purchases = await _purchaseDao.getAllPurchases();

    for (final purchase in purchases) {
      purchase.lineItems = await _purchaseLineItemDao
          .getPurchaseLineItemsByPurchaseId(purchase.id);
    }
    return purchases;
  }

  Future<Purchase?> getPurchaseById(String purchaseId) =>
      _purchaseDao.getPurchaseById(purchaseId);

  Future<bool> updatePurchase(PurchasesCompanion purchase) =>
      _purchaseDao.updatePurchaseData(purchase);

  Future<int> addPurchase(Purchase purchase) {
    var purchaseId = _purchaseDao.insertPurchase(purchase.toCompanion(true));
    if (purchase.lineItems!.isEmpty) return purchaseId;

    for (final item in purchase.lineItems!) {
      _purchaseLineItemDao.insertPurchaseLineItem(item.toCompanion(true));
    }
    return purchaseId;
  }

  Stream<List<Purchase>> watchAllPurchases() {
    final purchasesStream = _purchaseDao.watchAllPurchases();
    final lineItemsStream = _purchaseLineItemDao.watchAllPurchaseLineItems();

  // Combine the two streams so that whenever either emits new data,
  // we recalculate a joined List<PurchaseWithItems>
  return Rx.combineLatest2<List<Purchase>, List<PurchaseLineItem>, List<Purchase>>(
    purchasesStream,
    lineItemsStream,
    (purchases, lineItems) {
      // group lineItems by purchaseId
      final itemsByPurchaseId = <String, List<PurchaseLineItem>>{};

      for (final item in lineItems) {
        itemsByPurchaseId.putIfAbsent(item.purchaseId, () => []).add(item);
      }

      // create a new List<PurchaseWithItems>
      final purchaseWithItemsList = purchases.map((purchase) {
        final items = itemsByPurchaseId[purchase.id] ?? <PurchaseLineItem>[];

        return purchase.copyWith(lineItems: items);
        
      }).toList();

      return purchaseWithItemsList;
    });
  }

  Future<int> deletePurchase(String id) => _purchaseDao.deletePurchase(id);
}
