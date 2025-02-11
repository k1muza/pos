import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/sale_line_item_dao.dart';
import 'package:pos_meat_shop/data/repositories/I_sale_line_item_repo.dart';

class SaleLineItemRepository implements ISaleLineItemRepository {
  final SaleLineItemDao _salelineitemDao;

  SaleLineItemRepository(this._salelineitemDao);

  @override
  Stream<List<SaleLineItem>> watchAllSaleLineItems() =>
      _salelineitemDao.watchAllSaleLineItems();

  @override
  Future<List<SaleLineItem>> getAllSaleLineItems() =>
      _salelineitemDao.getAllSaleLineItems();

  @override
  Future<SaleLineItem?> getSaleLineItemById(salelineitemId) =>
      _salelineitemDao.getSaleLineItemById(salelineitemId);

  @override
  Future<List<SaleLineItem>> getSaleLineItemBySaleId(salelineitemId) =>
      _salelineitemDao.getSaleLineItemBySaleId(salelineitemId);

  @override
  Future<int> addSaleLineItem(SaleLineItemsCompanion salelineitem) =>
      _salelineitemDao.insertSaleLineItem(salelineitem);

  @override
  Future<bool> updateSaleLineItem(SaleLineItemsCompanion salelineitem) =>
      _salelineitemDao.updateSaleLineItemData(salelineitem);

  @override
  Future<int> deleteSaleLineItem(String id) =>
      _salelineitemDao.deleteSaleLineItem(id);
}
