// Purchase Line Item Provider

import 'package:pos_meat_shop/data/repos/purchase_line_item_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/data/database/purchase_line_item_dao.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});

final purchaseLineItemDaoProvider = Provider<PurchaseLineItemDao>((ref) {
  return PurchaseLineItemDao(ref.watch(appDatabaseProvider));
});

final purchaseLineItemRepositoryProvider = Provider<PurchaseLineItemRepository>(
    (ref) {
  return PurchaseLineItemRepository(ref.watch(purchaseLineItemDaoProvider));
});

final purchaseLineItemsProvider = FutureProvider.family<List<PurchaseLineItem>, int>((ref, purchaseId) async {
  final purchaseLineItemRepository = ref.watch(purchaseLineItemRepositoryProvider);
  return purchaseLineItemRepository.getPurchaseLineItemByPurchaseId(purchaseId);
});
