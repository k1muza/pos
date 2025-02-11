import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/sale_dao.dart';
import 'package:pos_meat_shop/data/repositories/I_sale_repo.dart';

class SaleRepository implements ISaleRepository {
  final SaleDao _saleDao;

  SaleRepository(this._saleDao);

  @override
  Stream<List<Sale>> watchAllSales() => _saleDao.watchAllSales();

  @override
  Future<List<Sale>> getAllSales() => _saleDao.getAllSales();

  @override
  Future<Sale?> getSaleById(saleId) => _saleDao.getSaleById(saleId);

  @override
  Future<int> addSale(Sale sale) => _saleDao.insertSale(sale.toCompanion(true));

  @override
  Future<bool> updateSale(SalesCompanion sale) => _saleDao.updateSaleData(sale);

  @override
  Future<int> deleteSale(String id) => _saleDao.deleteSale(id);
}
