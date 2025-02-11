import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/purchase_dao.dart';
import 'package:pos_meat_shop/data/database/purchase_line_item_dao.dart';
import 'package:pos_meat_shop/data/datasources/local/purchase_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/purchase_datasource.dart';
import 'package:pos_meat_shop/data/repositories/purchase_repository.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

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

final purchaseDaoProvider = Provider<PurchaseDao>((ref) {
  return PurchaseDao(ref.watch(appDatabaseProvider));
});

final purchaseLineItemDaoProvider = Provider<PurchaseLineItemDao>((ref) {
  return PurchaseLineItemDao(ref.watch(appDatabaseProvider));
});

final purchaseLocalDatasourceProvider = Provider<PurchaseLocalDataSource>((ref) {
  return PurchaseLocalDataSource(ref.watch(purchaseDaoProvider), ref.watch(purchaseLineItemDaoProvider));
});

final purchaseRemoteDatasourceProvider = Provider<PurchaseRemoteDatasource>((ref) {
  return PurchaseRemoteDatasource(ref.watch(graphQLClientProvider));
});

final purchaseRepositoryProvider = Provider<PurchaseRepository>((ref) {
  return PurchaseRepository(
    ref.watch(purchaseLocalDatasourceProvider), 
    ref.watch(purchaseRemoteDatasourceProvider));
});

final purchaseProvider = FutureProvider.family<Purchase?, String>((ref, id) async {
  final purchaseRepository = ref.watch(purchaseRepositoryProvider);
  return purchaseRepository.getPurchaseById(id);
});

final purchaseNotifierProvider =
    StateNotifierProvider<PurchaseStateNotifier, AsyncValue<List<Purchase>>>(
        (ref) {
  return PurchaseStateNotifier(ref.watch(purchaseRepositoryProvider));
});

class PurchaseStateNotifier extends StateNotifier<AsyncValue<List<Purchase>>> {
  final PurchaseRepository repo;

  late Stream<List<Purchase>> _purchaseStream;

  PurchaseStateNotifier(this.repo) : super(const AsyncValue.loading()) {
    _loadPurchases();
  }

  Future<void> _loadPurchases() async {
    repo.getAllPurchases();
    _purchaseStream = repo.watchAllPurchases();

    _purchaseStream.listen((purchases) {
      state = AsyncValue.data(purchases);
    }, onError: (err) {
      state = AsyncValue.error(err, StackTrace.current);
    });
  }
}
