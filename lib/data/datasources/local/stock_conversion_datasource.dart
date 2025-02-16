import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/stock_conversion_dao.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';

class StockConversionLocalDataSource {
  final StockConversionDao _stockConversionDao;

  StockConversionLocalDataSource(this._stockConversionDao);

  Future<List<StockConversion>> getAllStockConversions() =>
      _stockConversionDao.getAllStockConversions();

  Stream<List<StockConversion>> watchAllStockConversions() =>
      _stockConversionDao.watchAllStockConversions();

  Future<int> insertStockConversion(StockConversionsCompanion stockConversion) =>
      _stockConversionDao.insertStockConversion(stockConversion);

  Future<bool> updateStockConversionData(
          Insertable<StockConversion> stockConversion) =>
      _stockConversionDao.updateStockConversionData(stockConversion);

  Future<int> deleteStockConversion(String id) =>
      _stockConversionDao.deleteStockConversion(id);

  Future<StockConversion?> getStockConversionById(String id) =>
      _stockConversionDao.getStockConversionById(id);
}