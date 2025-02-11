import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/I_product_datasource.dart';
import 'package:pos_meat_shop/data/datasources/local/product_datasource.dart';
import 'package:pos_meat_shop/data/datasources/remote/product_datasource.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class ProductRepository implements IProductDataSource {
  final ProductLocalDataSourceImpl localDataSource;
  final ProductRemoteDataSourceImpl remoteDataSource;

  ProductRepository(this.localDataSource, this.remoteDataSource);

  @override
  Stream<List<Product>> watchAllProducts() => localDataSource.watchAllProducts();

  @override
  Future<List<Product>> getAllProducts() async {
    // 1. Fetch local data for immediate offline usage
    final localList = await localDataSource.getAllProducts();
    if (localList.isNotEmpty) {
      return localList;
    }

    // 2. If local is empty (or stale), fetch from remote
    try {
      final remoteList = await remoteDataSource.fetchAllProducts();
      for (final item in remoteList) {
        await localDataSource.addProduct(item.toCompanion(true));
      }
      return remoteList;
    } catch (e) {
      // If remote fetch fails and local is empty => error
      if (localList.isEmpty) {
        throw Exception('No local data & remote fetch failed: $e');
      }
      return localList;
    }
  }

  @override
  Future<Product?> getProductById(productId) => localDataSource.getProductById(productId);

  @override
  Future<void> addProduct(ProductsCompanion product) => localDataSource.addProduct(product);

  @override
  Future<bool> updateProduct(ProductsCompanion product ) => localDataSource.updateProduct(product);

  @override
  Future<int> deleteProduct(String id) => localDataSource.deleteProduct(id);
}
