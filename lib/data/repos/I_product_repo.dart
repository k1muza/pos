

import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(String productId);
  Future<bool> updateProduct(Product product);
  Future<void> addProduct(Product product);
  Stream<List<Product>> watchAllProducts();
  Future<int> deleteProduct(String id);
}
