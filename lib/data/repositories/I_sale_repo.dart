import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class ISaleRepository {
  Future<List<Sale>> getAllSales();
  Future<Sale?> getSaleById(String saleId);
  Future<bool> updateSale(SalesCompanion sale);
  Future<int> addSale(Sale sale);
  Stream<List<Sale>> watchAllSales();
  Future<int> deleteSale(String id);
}
