import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class ProductRemoteDataSourceImpl {
  final GraphQLClient client;

  ProductRemoteDataSourceImpl({required this.client});

  Future<List<Product>> fetchAllProducts() async {
    final response = await client.query(
      QueryOptions(
        document: gql('query { products { id name unitPrice unit createdAt } }'),
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }

    // Extract the data
    final data = response.data?['products'] as List<dynamic>?;
    if (data == null) {
      return [];
    }

    // Convert to ProductModel
    return data.map((json) => Product.fromJson(json)).toList();
  }

  Future<Product?> fetchProductById(String productId) async {
    final query = r'''
      query GetProductById($id: String!) {
        product(id: $id) {
          id
          name
          unitPrice
        }
      }
    ''';

    final result = await client.query(
      QueryOptions(
        document: gql(query),
        variables: {'id': productId},
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final productJson = result.data?['product'];
    if (productJson == null) return null;
    return Product.fromJson(productJson);
  }

  Future<bool> updateProduct(ProductsCompanion product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  Future<void> addProduct(ProductsCompanion product) async {
    // for example:
    final mutation = r'''
      mutation AddProduct($input: ProductInput!) {
        addProduct(input: $input) {
          id
        }
      }
    ''';

    final variables = {
      'input': {
        'id': product.id,
        'name': product.name,
        'unitPrice': product.unitPrice,
      }
    };

    final result = await client.mutate(
      MutationOptions(document: gql(mutation), variables: variables),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
  }

  Future<String> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  Stream<List<Product>> watchAllProducts() {
    // TODO: implement watchAllProducts
    throw UnimplementedError();
  }
}
