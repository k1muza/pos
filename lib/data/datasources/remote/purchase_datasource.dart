import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';

class PurchaseRemoteDatasource {
  final GraphQLClient client;

  PurchaseRemoteDatasource(this.client);

  Future<List<Purchase>> fetchAllPurchases() async {
    final response = await client.query(
      QueryOptions(
        document: gql('''
          query {
            purchases {
              id
              date
              items {
                id
                quantity
                unitCost
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
    return (response.data!['purchases'] as List)
        .map((e) => Purchase.fromJson(e))
        .toList();
  }

  Future<Purchase?> fetchPurchaseById(String purchaseId) async {
    final response = await client.query(
      QueryOptions(
        document: gql('''
          query { 
            purchase(id: $purchaseId) { 
              id 
              date
              items {
                id
                quantity
                unitCost
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
        variables: {'purchaseId': purchaseId},
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
    return (response.data!['purchase'] as Map<String, dynamic>?) != null
        ? Purchase.fromJson(response.data!['purchase'])
        : null;
  }

  Future<void> addPurchase(PurchasesCompanion purchase) async {
    final response = await client.mutate(
      MutationOptions(
        document: gql('mutation { createPurchase(input: $purchase) { id } }'),
        variables: {'purchase': purchase},
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }

  Future<void> updatePurchase(PurchasesCompanion purchase) async {
    final response = await client.mutate(
      MutationOptions(
        document: gql('mutation { updatePurchase(input: $purchase) { id } }'),
        variables: {'purchase': purchase},
      ),
    );
    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }
}
