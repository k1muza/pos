import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/stock_conversion_dao.dart';
import 'package:pos_meat_shop/data/datasources/local/stock_conversion_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/stock_conversion_datasource.dart';
import 'package:pos_meat_shop/data/repositories/stock_conversion_repo.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final httpLink = HttpLink('http://18.201.166.166/graphql/');

  return GraphQLClient(
    cache: GraphQLCache(), // Basic in-memory cache or custom
    link: httpLink, // or link if you have combined links
  );
});

final stockConversionDaoProvider = Provider<StockConversionDao>((ref) {
  return StockConversionDao(ref.watch(appDatabaseProvider));
});

final stockConversionLocalDatasourceProvider = Provider<StockConversionLocalDataSource>((ref) {
  return StockConversionLocalDataSource(ref.watch(stockConversionDaoProvider));
});

final stockConversionRemoteDatasourceProvider = Provider<StockConversionRemoteDatasource>((ref) {
  return StockConversionRemoteDatasource(ref.watch(graphQLClientProvider));
});

final stockConversionRepositoryProvider = Provider<StockConversionRepository>((ref) {
  final stockConversionLocalDatasource = ref.watch(stockConversionLocalDatasourceProvider);
  final stockConversionRemoteDatasource = ref.watch(stockConversionRemoteDatasourceProvider);
  return StockConversionRepository(
    stockConversionLocalDatasource,
    stockConversionRemoteDatasource,
  );
});

final stockConversionProvider =
FutureProvider.family<StockConversion?, String>((ref, stockConversionId) async {
  final stockConversionRepository = ref.watch(stockConversionRepositoryProvider);
  return stockConversionRepository.getStockConversionById(stockConversionId);
});

final stockConversionNotifierProvider =
StateNotifierProvider<StockConversionStateNotifier, AsyncValue<List<StockConversion>>>(
        (ref) {
      final repository = ref.watch(stockConversionRepositoryProvider);
      return StockConversionStateNotifier(repository);
    });

class StockConversionStateNotifier extends StateNotifier<AsyncValue<List<StockConversion>>> {
  final StockConversionRepository _repository;
  late final Stream<List<StockConversion>> _stockConversionStream;

  StockConversionStateNotifier(this._repository) : super(const AsyncValue.loading()) {
    _repository.getAllStockConversions();
    _stockConversionStream = _repository.watchAllStockConversions();
    _stockConversionStream.listen((stockConversions) {
      state = AsyncValue.data(stockConversions);
    }, onError: (error, stack) {
      state = AsyncValue.error(error, stack);
    });
  }

  Future<void> addStockConversion(StockConversionsCompanion stockConversion) async {
    await _repository.insertStockConversion(stockConversion);
  }

  Future<void> updateStockConversion(StockConversionsCompanion stockConversion) async {
    await _repository.updateStockConversionData(stockConversion);
  }

  Future<void> deleteStockConversion(String stockConversionId) async {
    await _repository.deleteStockConversion(stockConversionId);
  }

  StockConversion getStockConversionById(String stockConversionId) {
    return state.value!.firstWhere((p) => p.id == stockConversionId);
  }

  List<StockConversion> getStockConversions() {
    return state.value ?? [];
  }
}
