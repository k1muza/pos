import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

abstract class IProductDataSource {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(String productId);
  Future<bool> updateProduct(ProductsCompanion product);
  Future<void> addProduct(ProductsCompanion product);
  Stream<List<Product>> watchAllProducts();
  Future<int> deleteProduct(String id);
}
