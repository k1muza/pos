import 'package:pos_meat_shop/domain/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> fetchProducts();
  // Additional methods: getProductById(), addProduct(), etc.
}
