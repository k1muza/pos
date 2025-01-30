import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class ISaleLineItemRepository {
  Future<List<SaleLineItem>> getAllSaleLineItems();
  Future<SaleLineItem?> getSaleLineItemById(int salelineitemId);
  Future<List<SaleLineItem?>> getSaleLineItemBySaleId(int saleId);
  Future<bool> updateSaleLineItem(SaleLineItemsCompanion salelineitem);
  Future<void> addSaleLineItem(SaleLineItemsCompanion salelineitem);
  Stream<List<SaleLineItem>> watchAllSaleLineItems();
  Future<int> deleteSaleLineItem(int id);
}
