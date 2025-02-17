import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/sale_dao.dart';
import 'package:pos_meat_shop/data/database/sale_line_item_dao.dart';
import 'package:pos_meat_shop/data/datasources/local/sale_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/sale_datasource.dart';
import 'package:pos_meat_shop/data/repositories/sale_repository.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';

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
