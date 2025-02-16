import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';

class StockConversionRemoteDatasource {
  final GraphQLClient _client;

  StockConversionRemoteDatasource(this._client);

  Future<List<StockConversion>> fetchAllStockConversions() async {
    final response = await _client.query(
      QueryOptions(
        document: gql('''
          {
            stockConversions {
              id
              quantity
              unitCost
              date
              fromProduct {
                id
                name
                unit
                unitPrice
                unitCost
                description
              }
              toProduct {
                id
                name
                unit
                unitPrice
                unitCost
                description
              }
            }
          }
        '''),
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }

    final stockConversions =
        (response.data as Map<String, dynamic>)['stockConversions'] as List;
    return stockConversions.map((json) => StockConversion.fromJson(json)).toList();
  }

  Future<StockConversion?> fetchStockConversionById(String id) async {
    final response = await _client.query(
      QueryOptions(
        document: gql('''
          query {
            stockConversion(id: "$id") {
              id
              quantity
              unitCost
              date
              fromProduct {
                id
                name
                unit
                unitPrice
                unitCost
                description
              }
              toProduct {
                id
                name
                unit
                unitPrice
                unitCost
                description
              }
            }
          }
        '''),
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }

    final stockConversion =
        response.data!['stockConversion'] as Map<String, dynamic>?;
    return stockConversion != null ? StockConversion.fromJson(stockConversion) : null;
  }

  Future<void> addStockConversion(StockConversionsCompanion stockConversion) async {
    final response = await _client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            createStockConversion(input: $stockConversion) {
              id
            }
          }
        '''),
        variables: {'stockConversion': stockConversion},
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }

  Future<void> updateStockConversion(StockConversionsCompanion stockConversion) async {
    final response = await _client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            updateStockConversion(input: $stockConversion) {
              id
            }
          }
        '''),
        variables: {'stockConversion': stockConversion},
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }

  Future<void> deleteStockConversion(String id) async {
    final response = await _client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            deleteStockConversion(id: "$id")
          }
        '''),
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }
}