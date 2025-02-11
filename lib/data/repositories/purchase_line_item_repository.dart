import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/purchase_line_item_dao.dart';
import 'package:pos_meat_shop/data/repositories/I_purchase_line_repo.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';

class PurchaseLineItemRepository implements IPurchaseLineItemRepository {
  final PurchaseLineItemDao _purchaselineitemDao;

  PurchaseLineItemRepository(this._purchaselineitemDao);

  @override
  Stream<List<PurchaseLineItem>> watchAllPurchaseLineItems() =>
      _purchaselineitemDao.watchAllPurchaseLineItems();

  @override
  Future<List<PurchaseLineItem>> getAllPurchaseLineItems() =>
      _purchaselineitemDao.getAllPurchaseLineItems();

  @override
  Future<PurchaseLineItem?> getPurchaseLineItemById(purchaselineitemId) =>
      _purchaselineitemDao.getPurchaseLineItemById(purchaselineitemId);

  @override
  Future<List<PurchaseLineItem>> getPurchaseLineItemByPurchaseId(purchaselineitemId) =>
      _purchaselineitemDao.getPurchaseLineItemByPurchaseId(purchaselineitemId);

  @override
  Future<int> addPurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem) =>
      _purchaselineitemDao.insertPurchaseLineItem(purchaselineitem);

  @override
  Future<bool> updatePurchaseLineItem(PurchaseLineItemsCompanion purchaselineitem) =>
      _purchaselineitemDao.updatePurchaseLineItemData(purchaselineitem);

  @override
  Future<int> deletePurchaseLineItem(String id) =>
      _purchaselineitemDao.deletePurchaseLineItem(id);
}
