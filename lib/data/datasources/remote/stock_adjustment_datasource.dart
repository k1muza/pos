import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/stock_adjustment.dart';

class StockAdjustmentRemoteDatasource {
  final GraphQLClient _client;

  StockAdjustmentRemoteDatasource(this._client);

  Future<List<StockAdjustment>> fetchAllStockAdjustments() async {
    final response = await _client.query(
      QueryOptions(
        document: gql('''
          {
            stockAdjustments {
              id
              quantity
              unitCost
              date
              reason
              product {
                id
                name
                unitPrice
                unitCost
              }
            }
          }
        '''),
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }

    final stockAdjustments =
        (response.data as Map<String, dynamic>)['stockAdjustments'] as List;
    return stockAdjustments.map((json) => StockAdjustment.fromJson(json)).toList();
  }

  Future<StockAdjustment?> fetchStockAdjustmentById(String id) async {
    final response = await _client.query(
      QueryOptions(
        document: gql('''
          query {
            stockAdjustment(id: "$id") {
              id
              quantity
              unitCost
              date
              reason
              product {
                id
                name
                unitPrice
                unitCost
              }
            }
          }
        '''),
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }

    final stockAdjustment = response.data!['stockAdjustment'] as Map<String, dynamic>?;
    return stockAdjustment != null ? StockAdjustment.fromJson(stockAdjustment) : null;
  }

  Future<void> addStockAdjustment(StockAdjustmentsCompanion stockAdjustment) async {
    final response = await _client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            createStockAdjustment(input: $stockAdjustment) {
              id
            }
          }
        '''),
        variables: {'stockAdjustment': stockAdjustment},
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }

  Future<void> updateStockAdjustment(StockAdjustmentsCompanion stockAdjustment) async {
    final response = await _client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            updateStockAdjustment(input: $stockAdjustment) {
              id
            }
          }
        '''),
        variables: {'stockAdjustment': stockAdjustment},
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }

  Future<void> deleteStockAdjustment(String id) async {
    final response = await _client.mutate(
      MutationOptions(
        document: gql('''
          mutation {
            deleteStockAdjustment(id: "$id")
          }
        '''),
      ),
    );

    if (response.hasException) {
      throw Exception(response.exception.toString());
    }
  }
}