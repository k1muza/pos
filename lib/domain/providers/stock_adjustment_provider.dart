import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/stock_adjustment_dao.dart';
import 'package:pos_meat_shop/data/datasources/local/stock_adjustment_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/stock_adjustment_datasource.dart';
import 'package:pos_meat_shop/data/repositories/stock_adjustment_repo.dart';
import 'package:pos_meat_shop/domain/models/stock_adjustment.dart';

import 'database_provider.dart';
import 'graphql_client_provider.dart';

final stockAdjustmentDaoProvider = Provider<StockAdjustmentDao>((ref) {
  return StockAdjustmentDao(ref.watch(appDatabaseProvider));
});

final stockAdjustmentLocalDatasourceProvider = Provider<StockAdjustmentLocalDatasource>((ref) {
  return StockAdjustmentLocalDatasource(ref.watch(stockAdjustmentDaoProvider));
});

final stockAdjustmentRemoteDatasourceProvider = Provider<StockAdjustmentRemoteDatasource>((ref) {
  return StockAdjustmentRemoteDatasource(ref.watch(graphQLClientProvider));
});

final stockAdjustmentRepositoryProvider = Provider<StockAdjustmentRepository>((ref) {
  final stockAdjustmentLocalDatasource = ref.watch(stockAdjustmentLocalDatasourceProvider);
  final stockAdjustmentRemoteDatasource = ref.watch(stockAdjustmentRemoteDatasourceProvider);
  return StockAdjustmentRepository(
    stockAdjustmentLocalDatasource,
    stockAdjustmentRemoteDatasource,
  );
});

final stockAdjustmentProvider =
FutureProvider.family<StockAdjustment?, String>((ref, stockAdjustmentId) async {
  final stockAdjustmentRepository = ref.watch(stockAdjustmentRepositoryProvider);
  return stockAdjustmentRepository.getStockAdjustmentById(stockAdjustmentId);
});

final stockAdjustmentNotifierProvider =
StateNotifierProvider<StockAdjustmentStateNotifier, AsyncValue<List<StockAdjustment>>>(
        (ref) {
      final repository = ref.watch(stockAdjustmentRepositoryProvider);
      return StockAdjustmentStateNotifier(repository);
    });

class StockAdjustmentStateNotifier extends StateNotifier<AsyncValue<List<StockAdjustment>>> {
  final StockAdjustmentRepository _repository;
  late final Stream<List<StockAdjustment>> _stockAdjustmentStream;

  StockAdjustmentStateNotifier(this._repository) : super(const AsyncValue.loading()) {
    _stockAdjustmentStream = _repository.watchAllStockAdjustments();
    _stockAdjustmentStream.listen((stockAdjustments) {
      state = AsyncValue.data(stockAdjustments);
    }, onError: (error, stack) {
      state = AsyncValue.error(error, stack);
    });
  }

  Future<void> addStockAdjustment(StockAdjustmentsCompanion stockAdjustment) async {
    await _repository.insertStockAdjustment(stockAdjustment);
  }

  Future<void> updateStockAdjustment(StockAdjustmentsCompanion stockAdjustment) async {
    await _repository.updateStockAdjustmentData(stockAdjustment);
  }

  Future<void> deleteStockAdjustment(String stockAdjustmentId) async {
    await _repository.deleteStockAdjustment(stockAdjustmentId);
  }

  StockAdjustment getStockAdjustmentById(String stockAdjustmentId) {
    return state.value!.firstWhere((p) => p.id == stockAdjustmentId);
  }

  List<StockAdjustment> getStockAdjustments() {
    return state.value ?? [];
  }
}
