import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/sale_line_item_dao.dart';
import 'package:pos_meat_shop/data/repositories/sale_line_item_repository.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';

import 'database_provider.dart';

final saleLineItemDaoProvider = Provider<SaleLineItemDao>((ref) {
  return SaleLineItemDao(ref.watch(appDatabaseProvider));
});

final saleLineItemRepositoryProvider = Provider<SaleLineItemRepository>((ref) {
  return SaleLineItemRepository(ref.watch(saleLineItemDaoProvider));
});

final saleLineItemsProvider =
    FutureProvider.family<List<SaleLineItem>, String>((ref, saleId) async {
  final saleLineItemRepository = ref.watch(saleLineItemRepositoryProvider);
  return saleLineItemRepository.getSaleLineItemBySaleId(saleId);
});
