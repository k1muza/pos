

import 'package:pos_meat_shop/data/database/app_database.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(int productId);
  Future<bool> updateProduct(ProductsCompanion product);
  Future<void> addProduct(ProductsCompanion product);
  Stream<List<Product>> watchAllProducts();
  Future<int> deleteProduct(int id);
}
