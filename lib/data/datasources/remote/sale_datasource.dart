import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';

class SaleRemoteDatasource {
  final GraphQLClient client;

  SaleRemoteDatasource(this.client);

  Future<List<Sale>> fetchAllSales() async {
    final response = await client.query(
      QueryOptions(
        document: gql('''
          query {
            sales {
              id
              date
              items {
                id
                quantity
                unitPrice
                product {
                  id
                  name
                  description
                  unitPrice
                  unitCost
                  unit
                }
              }
            }
          }
          '''),
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
    return (response.data!['sales'] as List)
        .map((e) => Sale.fromJson(e))
        .toList();
  }

  Future<Sale?> fetchSaleById(String saleId) async {
    final response = await client.query(
      QueryOptions(
        document: gql('''
          query { 
            sale(id: $saleId) { 
              id 
              date
              items {
                id
                quantity
                unitPrice
                product {
                  id
                  name
                  description
                  unitPrice
                  unitCost
                }
              } 
            } 
          }'''),
        variables: {'saleId': saleId},
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
    return (response.data!['sale'] as Map<String, dynamic>?) != null
        ? Sale.fromJson(response.data!['sale'])
        : null;
  }

  Future<void> addSale(SalesCompanion sale) async {
    final response = await client.mutate(
      MutationOptions(
        document: gql('mutation { createSale(input: $sale) { id } }'),
        variables: {'sale': sale},
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }

  Future<void> updateSale(SalesCompanion sale) async {
    final response = await client.mutate(
      MutationOptions(
        document: gql('mutation { updateSale(input: $sale) { id } }'),
        variables: {'sale': sale},
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }
}
