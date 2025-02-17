import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/local/stock_conversion_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/stock_conversion_datasource.dart';
import 'package:pos_meat_shop/data/repositories/I_stock_conversion_repo.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';

class StockConversionRepository implements IStockConversionRepository {
  final StockConversionLocalDataSource stockConversionLocalDataSource;
  final StockConversionRemoteDatasource stockConversionRemoteDataSource;

  StockConversionRepository(this.stockConversionLocalDataSource, this.stockConversionRemoteDataSource);

  @override
  Future<List<StockConversion>> getAllStockConversions() => stockConversionLocalDataSource.getAllStockConversions();

  @override
  Future<StockConversion?> getStockConversionById(String stockConversionId) =>
      stockConversionLocalDataSource.getStockConversionById(stockConversionId);

  @override
  Stream<List<StockConversion>> watchAllStockConversions() {

    // Trigger a remote fetch in parallel (fire-and-forget)
    stockConversionRemoteDataSource.fetchAllStockConversions().then((remoteConversions) async {
      // Optionally, check for duplicates or merge changes.
      for (final conversion in remoteConversions) {
        await stockConversionLocalDataSource.insertStockConversion(conversion.toCompanion(true));
      }
    }).catchError((error) {
      // Handle errors if needed.
      print("Remote fetch error: $error");
    });

    return stockConversionLocalDataSource.watchAllStockConversions();
  }

  @override
  Future<int> deleteStockConversion(String id) => stockConversionLocalDataSource.deleteStockConversion(id);

  @override
  Future<int> insertStockConversion(StockConversionsCompanion stockConversion) {
    // TODO: implement insertStockConversion
    throw UnimplementedError();
  }

  @override
  Future<bool> updateStockConversionData(Insertable<StockConversion> stockConversion) {
    // TODO: implement updateStockConversionData
    throw UnimplementedError();
  }
}
