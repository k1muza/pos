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
  Future<List<Sale>> getAllSales() => saleLocalDataSource.getAllSales();

  @override
  Future<Sale?> getSaleById(String saleId) =>
      saleLocalDataSource.getSaleById(saleId);

  @override
  Stream<Sale?> watchSaleById(String saleId) =>
      saleLocalDataSource.watchSaleById(saleId);

  @override
  Future<bool> updateSale(SalesCompanion sale) =>
      saleLocalDataSource.updateSale(sale);

  @override
  Future<int> addSale(Sale sale) =>
      saleLocalDataSource.addSale(sale);

  @override
  Stream<List<Sale>> watchAllSales() {
      Stream<List<Sale>> stream = saleLocalDataSource.watchAllSales();

      // Trigger a remote fetch in parallel (fire-and-forget)
      saleRemoteDataSource.fetchAllSales().then((remoteSales) async {
        // Optionally, check for duplicates or merge changes.
        for (final sale in remoteSales) {
          await saleLocalDataSource.addSale(sale);
        }
      }).catchError((error) {
        // Handle errors if needed.
        print("Remote fetch error: $error");
      });

      return stream;
  }

  @override
  Future<int> deleteSale(String id) => saleLocalDataSource.deleteSale(id);
}
