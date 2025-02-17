import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/local/stock_adjustment_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/stock_adjustment_datasource.dart';
import 'package:pos_meat_shop/data/repositories/I_stock_adjustment_repo.dart';
import 'package:pos_meat_shop/domain/models/stock_adjustment.dart';

class StockAdjustmentRepository implements IStockAdjustmentRepository {
  final StockAdjustmentLocalDatasource stockAdjustmentLocalDataSource;
  final StockAdjustmentRemoteDatasource stockAdjustmentRemoteDataSource;

  StockAdjustmentRepository(this.stockAdjustmentLocalDataSource, this.stockAdjustmentRemoteDataSource);

  @override
  Future<List<StockAdjustment>> getAllStockAdjustments() async {
    var stockAdjustments = await stockAdjustmentLocalDataSource.getAllStockAdjustments();

    if (stockAdjustments.isNotEmpty) {
      return stockAdjustments;
    }

    stockAdjustments = await stockAdjustmentRemoteDataSource.fetchAllStockAdjustments();

    for (final stockAdjustment in stockAdjustments) {
      await stockAdjustmentLocalDataSource.insertStockAdjustment(stockAdjustment.toCompanion(true));
    }

    return await stockAdjustmentLocalDataSource.getAllStockAdjustments();
  }

  @override
  Future<StockAdjustment?> getStockAdjustmentById(String stockAdjustmentId) =>
      stockAdjustmentLocalDataSource.getStockAdjustmentById(stockAdjustmentId);

  @override
  Stream<List<StockAdjustment>> watchAllStockAdjustments() {
    // Trigger a remote fetch in parallel (fire-and-forget)
    stockAdjustmentRemoteDataSource.fetchAllStockAdjustments().then((remoteStockAdjustments) async {
      // Optionally, check for duplicates or merge changes.
      for (final stockAdjustment in remoteStockAdjustments) {
        await stockAdjustmentLocalDataSource.insertStockAdjustment(stockAdjustment.toCompanion(true));
      }
    }).catchError((error) {
      // Handle errors if needed.
      print("Remote fetch error: $error");
    });
    return stockAdjustmentLocalDataSource.watchAllStockAdjustments();
  }

  @override
  Future<int> deleteStockAdjustment(String id) => stockAdjustmentLocalDataSource.deleteStockAdjustment(id);

  @override
  Future<int> insertStockAdjustment(StockAdjustmentsCompanion stockAdjustment) {
    // TODO: implement insertStockAdjustment
    throw UnimplementedError();
  }

  @override
  Future<bool> updateStockAdjustmentData(Insertable<StockAdjustment> stockAdjustment) {
    // TODO: implement updateStockAdjustmentData
    throw UnimplementedError();
  }
}
