import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/datasources/I_product_datasource.dart';

class ProductRemoteDataSourceImpl implements IProductDataSource {
  final http.Client client;
  final url = 'https://jsonplaceholder.typicode.com/posts';

  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<List<Product>> getAllProducts() async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<Product?> getProductById(int productId) async {
    final response = await client.get(Uri.parse('$url/$productId'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Future<bool> updateProduct(ProductsCompanion product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<void> addProduct(ProductsCompanion product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<int> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Stream<List<Product>> watchAllProducts() {
    // TODO: implement watchAllProducts
    throw UnimplementedError();
  }
}
