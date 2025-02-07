import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/product_dao.dart';
import 'package:pos_meat_shop/data/datasources/I_product_datasource.dart';
import 'package:pos_meat_shop/data/datasources/local/product_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/product_datasource.dart';
import 'package:pos_meat_shop/data/repositories/product_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final productDaoProvider = Provider<ProductDao>((ref) {
  return ProductDao(ref.watch(appDatabaseProvider));
});

final productLocalDatasourceProvider = Provider<IProductDataSource>((ref) {
  return ProductLocalDataSourceImpl(ref.watch(productDaoProvider));
});

final productRemoteDatasourceProvider = Provider<IProductDataSource>((ref) {
  return ProductRemoteDataSourceImpl(client: ref.watch(httpClientProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productLocalDatasource = ref.watch(productLocalDatasourceProvider);
  final productRemoteDatasource = ref.watch(productRemoteDatasourceProvider);
  return ProductRepository(
    productLocalDatasource,
    productRemoteDatasource,
  );
});

final productProvider =
    FutureProvider.family<Product?, int>((ref, productId) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProductById(productId);
});

final productNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, AsyncValue<List<Product>>>(
        (ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductStateNotifier(repository);
});

class ProductStateNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepository _repository;
  late final Stream<List<Product>> _productStream;

  ProductStateNotifier(this._repository) : super(const AsyncValue.loading()) {
    _productStream = _repository.watchAllProducts();
    _productStream.listen((products) {
      state = AsyncValue.data(products);
    }, onError: (error, stack) {
      state = AsyncValue.error(error, stack);
    });
  }

  Future<void> addProduct(ProductsCompanion product) async {
    await _repository.addProduct(product);
  }

  Future<void> updateProduct(ProductsCompanion product) async {
    await _repository.updateProduct(product);
  }

  Future<void> deleteProduct(int productId) async {
    await _repository.deleteProduct(productId);
  }

  Product getProductById(String productId) {
    return state.value!.firstWhere((p) => p.id == productId);
  }

  List<Product> getProducts() {
    return state.value ?? [];
  }
}
