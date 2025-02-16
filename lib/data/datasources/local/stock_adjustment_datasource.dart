import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/stock_adjustment_dao.dart';
import 'package:pos_meat_shop/domain/models/stock_adjustment.dart';
import 'package:rxdart/rxdart.dart';

class StockAdjustmentLocalDatasource {
  final StockAdjustmentDao _stockAdjustmentDao;

  StockAdjustmentLocalDatasource(this._stockAdjustmentDao);

  Future<List<StockAdjustment>> getAllStockAdjustments() =>
      _stockAdjustmentDao.getAllStockAdjustments();

  Stream<List<StockAdjustment>> watchAllStockAdjustments() =>
      _stockAdjustmentDao.watchAllStockAdjustments();

  Future<StockAdjustment?> getStockAdjustmentById(String id) =>
      _stockAdjustmentDao.getStockAdjustmentById(id);

  Future<int> insertStockAdjustment(StockAdjustmentsCompanion stockAdjustment) =>
      _stockAdjustmentDao.insertStockAdjustment(stockAdjustment);

  Future<bool> updateStockAdjustmentData(Insertable<StockAdjustment> stockAdjustment) =>
      _stockAdjustmentDao.updateStockAdjustmentData(stockAdjustment);

  Future<int> deleteStockAdjustment(String id) =>
      _stockAdjustmentDao.deleteStockAdjustment(id);
}