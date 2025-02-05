import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/sale_dao.dart';
import 'package:pos_meat_shop/data/repos/sale_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});

final saleDaoProvider = Provider<SaleDao>((ref) {
  return SaleDao(ref.watch(appDatabaseProvider));
});

final saleRepositoryProvider = Provider<SaleRepository>((ref) {
  return SaleRepository(ref.watch(saleDaoProvider));
});

final saleNotifierProvider =
    StateNotifierProvider<SaleStateNotifier, AsyncValue<List<Sale>>>((ref) {
  final repository = ref.watch(saleRepositoryProvider);
  return SaleStateNotifier(repository);
});

class SaleStateNotifier extends StateNotifier<AsyncValue<List<Sale>>> {
  final SaleRepository _repository;
  late final Stream<List<Sale>> _saleStream;

  SaleStateNotifier(this._repository) : super(const AsyncValue.loading()) {
    _saleStream = _repository.watchAllSales();
    _saleStream.listen((sales) {
      state = AsyncValue.data(sales);
    }, onError: (error, stack) {
      state = AsyncValue.error(error, stack);
    });
  }

  Future<int> addSale(SalesCompanion sale) async => _repository.addSale(sale);

  Future<void> updateSale(SalesCompanion sale) async {
    await _repository.updateSale(sale);
  }

  Future<void> deleteSale(int saleId) async {
    await _repository.deleteSale(saleId);
  }

  Sale getSaleById(String saleId) {
    return state.value!.firstWhere((p) => p.id == saleId);
  }

  List<Sale> getSales() {
    return state.value ?? [];
  }
}
