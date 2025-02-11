import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class ISaleLineItemRepository {
  Future<List<SaleLineItem>> getAllSaleLineItems();
  Future<SaleLineItem?> getSaleLineItemById(String salelineitemId);
  Future<List<SaleLineItem?>> getSaleLineItemBySaleId(String saleId);
  Future<bool> updateSaleLineItem(SaleLineItemsCompanion salelineitem);
  Future<int> addSaleLineItem(SaleLineItemsCompanion salelineitem);
  Stream<List<SaleLineItem>> watchAllSaleLineItems();
  Future<int> deleteSaleLineItem(String id);
}
