import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/local/sale_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/sale_datasource.dart';
import 'package:pos_meat_shop/data/repositories/I_sale_repo.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';

class SaleRepository implements ISaleRepository {
  final SaleLocalDataSource saleLocalDataSource;
  final SaleRemoteDatasource saleRemoteDataSource;

  SaleRepository(this.saleLocalDataSource, this.saleRemoteDataSource);

  @override
  Future<List<Sale>> getAllSales() async {
    var sales = await saleLocalDataSource.getAllSales();

    if (sales.isNotEmpty) {
      return sales;
    }

    sales = await saleRemoteDataSource.fetchAllSales();

    for (final sale in sales) {
      await saleLocalDataSource.addSale(sale);
    }

    return await saleLocalDataSource.getAllSales();
  }

  @override
  Future<Sale?> getSaleById(String saleId) =>
      saleLocalDataSource.getSaleById(saleId);

  @override
  Future<bool> updateSale(SalesCompanion sale) =>
      saleLocalDataSource.updateSale(sale);

  @override
  Future<int> addSale(Sale sale) =>
      saleLocalDataSource.addSale(sale);

  @override
  Stream<List<Sale>> watchAllSales() =>
      saleLocalDataSource.watchAllSales();

  @override
  Future<int> deleteSale(String id) => saleLocalDataSource.deleteSale(id);
}
