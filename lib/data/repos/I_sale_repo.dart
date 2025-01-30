import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class ISaleRepository {
  Future<List<Sale>> getAllSales();
  Future<Sale?> getSaleById(int saleId);
  Future<bool> updateSale(SalesCompanion sale);
  Future<void> addSale(SalesCompanion sale);
  Stream<List<Sale>> watchAllSales();
  Future<int> deleteSale(int id);
}
