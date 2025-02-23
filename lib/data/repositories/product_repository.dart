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
  Stream<List<Product>> watchAllProducts() {
    // Trigger a remote fetch in parallel (fire-and-forget)
    remoteDataSource.fetchAllProducts().then((remoteProducts) async {
      // Optionally, check for duplicates or merge changes.
      for (final product in remoteProducts) {
        await localDataSource.addProduct(product.toCompanion(true));
      }
    }).catchError((error) {
      // Handle errors if needed.
      print("Remote fetch error: $error");
    });

    return localDataSource.watchAllProducts();
  }

  @override
  Future<List<Product>> getAllProducts() async => localDataSource.getAllProducts();

  @override
  Future<Product?> getProductById(productId) => localDataSource.getProductById(productId);

  @override
  Future<void> addProduct(ProductsCompanion product) => localDataSource.addProduct(product);

  @override
  Future<bool> updateProduct(ProductsCompanion product ) => localDataSource.updateProduct(product);

  @override
  Future<int> deleteProduct(String id) => localDataSource.deleteProduct(id);
}
