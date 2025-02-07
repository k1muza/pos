import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/I_product_datasource.dart';

class ProductRepository implements IProductDataSource {
  final IProductDataSource localDataSource;
  final IProductDataSource remoteDataSource;

  ProductRepository(this.localDataSource, this.remoteDataSource);

  @override
  Stream<List<Product>> watchAllProducts() => localDataSource.watchAllProducts();

  @override
  Future<List<Product>> getAllProducts() => localDataSource.getAllProducts();

  @override
  Future<Product?> getProductById(productId) => localDataSource.getProductById(productId);

  @override
  Future<void> addProduct(ProductsCompanion product) => localDataSource.addProduct(product);

  @override
  Future<bool> updateProduct(ProductsCompanion product ) => localDataSource.updateProduct(product);

  @override
  Future<int> deleteProduct(int id) => localDataSource.deleteProduct(id);
}
