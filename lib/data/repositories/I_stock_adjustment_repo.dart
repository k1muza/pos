import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/stock_adjustment.dart';

import '../database/app_database.dart';

abstract class IStockAdjustmentRepository {
  Future<List<StockAdjustment>> getAllStockAdjustments();
  Stream<List<StockAdjustment>> watchAllStockAdjustments();
  Future<StockAdjustment?> getStockAdjustmentById(String id);
  Future<int> insertStockAdjustment(StockAdjustmentsCompanion stockAdjustment);
  Future<bool> updateStockAdjustmentData(Insertable<StockAdjustment> stockAdjustment);
  Future<int> deleteStockAdjustment(String id);
}