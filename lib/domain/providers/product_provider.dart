import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/product_dao.dart';
import 'package:pos_meat_shop/data/repos/product_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final productDaoProvider = Provider<ProductDao>((ref) {
  return ProductDao(ref.watch(appDatabaseProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(ref.watch(productDaoProvider));
});

final productNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, AsyncValue<List<Product>>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductStateNotifier(repository);
});

class ProductStateNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepository _repository;
  late final Stream<List<Product>> _productStream;

  ProductStateNotifier(this._repository)
      : super(const AsyncValue.loading()) {
    _productStream = _repository.watchAllProducts();
    _productStream.listen((products) {
      state = AsyncValue.data(products);
    }, onError: (error, stack) {
      state = AsyncValue.error(error, stack);
    });
  }

  Future<void> addProduct(Product product) async {
    await _repository.addProduct(product);
  }

  Future<void> updateProduct(Product product) async {
    await _repository.updateProduct(product);
  }

  Future<void> deleteProduct(String productId) async {
    await _repository.deleteProduct(productId);
  }

  Product getProductById(String productId) {
    return state.value!.firstWhere((p) => p.id == productId);
  }

  List<Product> getProducts() {
    return state.value ?? [];
  }
}
