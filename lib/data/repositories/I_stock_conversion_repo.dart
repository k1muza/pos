import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';

import '../database/app_database.dart';

abstract class IStockConversionRepository {
  Future<List<StockConversion>> getAllStockConversions();
  Stream<List<StockConversion>> watchAllStockConversions();
  Future<StockConversion?> getStockConversionById(String id);
  Future<int> insertStockConversion(StockConversionsCompanion stockConversion);
  Future<bool> updateStockConversionData(Insertable<StockConversion> stockConversion);
  Future<int> deleteStockConversion(String id);
}