import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/purchase_dao.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});

final purchaseDaoProvider = Provider<PurchaseDao>((ref) {
  return PurchaseDao(ref.watch(appDatabaseProvider));
});

final purchaseRepositoryProvider = Provider<PurchaseRepository>((ref) {
  return PurchaseRepository(ref.watch(purchaseDaoProvider));
});

final purchaseProvider = FutureProvider.family<Purchase?, int>((ref, id) async {
  final purchaseRepository = ref.watch(purchaseRepositoryProvider);
  return purchaseRepository.getPurchaseById(id);
});

final purchaseNotifierProvider =
    StateNotifierProvider<PurchaseStateNotifier, AsyncValue<List<Purchase>>>(
        (ref) {
  return PurchaseStateNotifier(ref.watch(purchaseDaoProvider));
});

class PurchaseStateNotifier extends StateNotifier<AsyncValue<List<Purchase>>> {
  final PurchaseDao _dao;

  late Stream<List<Purchase>> _purchaseStream;

  PurchaseStateNotifier(this._dao) : super(const AsyncValue.loading()) {
    _loadPurchases();
  }

  Future<void> _loadPurchases() async {
    _purchaseStream = _dao.watchAllPurchases();

    _purchaseStream.listen((purchases) {
      state = AsyncValue.data(purchases);
    }, onError: (err) {
      state = AsyncValue.error(err, StackTrace.current);
    });
  }
}

class PurchaseRepository {
  final PurchaseDao _dao;

  PurchaseRepository(this._dao);

  Future<Purchase?> getPurchaseById(int purchaseId) async {
    return _dao.getPurchaseById(purchaseId);
  }

  /// Gets all purchases from the database.
  ///
  /// This function is a passthrough to [PurchaseDao.getAllPurchases], and is
  /// intended to be used as a riverpod provider.
  Future<List<Purchase>> getAllPurchases() async {
    return _dao.getAllPurchases();
  }
}
