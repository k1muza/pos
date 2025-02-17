import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/sale_dao.dart';
import 'package:pos_meat_shop/data/database/sale_line_item_dao.dart';
import 'package:pos_meat_shop/data/datasources/local/sale_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/sale_datasource.dart';
import 'package:pos_meat_shop/data/repositories/sale_repository.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';

import 'database_provider.dart';
import 'graphql_client_provider.dart';

final saleDaoProvider = Provider<SaleDao>((ref) {
  return SaleDao(ref.watch(appDatabaseProvider));
});

final saleLineItemDaoProvider = Provider<SaleLineItemDao>((ref) {
  return SaleLineItemDao(ref.watch(appDatabaseProvider));
});

final saleLocalDatasourceProvider = Provider<SaleLocalDataSource>((ref) {
  return SaleLocalDataSource(ref.watch(saleDaoProvider), ref.watch(saleLineItemDaoProvider));
});

final saleRemoteDatasourceProvider = Provider<SaleRemoteDatasource>((ref) {
  return SaleRemoteDatasource(ref.watch(graphQLClientProvider));
});

final saleRepositoryProvider = Provider<SaleRepository>((ref) {
  return SaleRepository(
    ref.watch(saleLocalDatasourceProvider), 
    ref.watch(saleRemoteDatasourceProvider));
});

final saleProvider = StreamProvider.family<Sale?, String>((ref, id) {
  final saleRepository = ref.watch(saleRepositoryProvider);
  return saleRepository.watchSaleById(id);
});

final saleNotifierProvider =
    StateNotifierProvider<SalesStateNotifier, AsyncValue<List<Sale>>>(
        (ref) {
  return SalesStateNotifier(ref.watch(saleRepositoryProvider));
});

class SalesStateNotifier extends StateNotifier<AsyncValue<List<Sale>>> {
  final SaleRepository repo;

  late Stream<List<Sale>> _saleStream;

  SalesStateNotifier(this.repo) : super(const AsyncValue.loading()) {
    _loadSales();
  }

  Future<void> _loadSales() async {
    _saleStream = repo.watchAllSales();

    _saleStream.listen((sales) {
      state = AsyncValue.data(sales);
    }, onError: (err) {
      state = AsyncValue.error(err, StackTrace.current);
    });
  }
}
