import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/sale_line_item_dao.dart';
import 'package:pos_meat_shop/data/repos/sale_line_item_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final saleLineItemDaoProvider = Provider<SaleLineItemDao>((ref) {
  return SaleLineItemDao(ref.watch(appDatabaseProvider));
});

final saleLineItemRepositoryProvider = Provider<SaleLineItemRepository>((ref) {
  return SaleLineItemRepository(ref.watch(saleLineItemDaoProvider));
});

final saleLineItemsProvider =
    FutureProvider.family<List<SaleLineItem>, int>((ref, saleId) async {
  final saleLineItemRepository = ref.watch(saleLineItemRepositoryProvider);
  return saleLineItemRepository.getSaleLineItemBySaleId(saleId);
});
