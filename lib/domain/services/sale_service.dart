import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/cart_provider.dart';
import 'package:drift/drift.dart' show Value;
import 'package:pos_meat_shop/domain/providers/product_provider.dart';

sealed class SaleState {
  const SaleState();
}

class SaleInitial extends SaleState {
  const SaleInitial();
}

class SaleLoading extends SaleState {
  const SaleLoading();
}

class SaleSuccess extends SaleState {
  final int saleId;
  const SaleSuccess(this.saleId);
}

class SaleFailure extends SaleState {
  final String error;
  const SaleFailure(this.error);
}


class SaleNotifier extends StateNotifier<SaleState> {
  final AppDatabase db;
  SaleNotifier(this.db) : super(const SaleInitial());

  Future<void> processSale(WidgetRef ref) async {
    // If the UI is re-triggered while loading, you might handle it
    // or simply do nothing. Here, let's reset to loading.
    state = const SaleLoading();

    final cartItems = ref.read(cartProvider);
    if (cartItems.isEmpty) {
      // Nothing to sell, but let's consider that a 'failure' or do nothing
      state = const SaleFailure("Cart is empty");
      return;
    }

    try {
      // Transaction logic
      final saleId = await db.transaction(() async {
        final saleId = await db.into(db.sales).insert(
          SalesCompanion.insert(
            publishedAt: Value(DateTime.now()),
          ),
        );
        for (final cartItem in cartItems) {
          await db.into(db.saleLineItems).insert(
            SaleLineItemsCompanion(
              sale: Value(saleId),
              product: Value(cartItem.product.id),
              quantity: Value(cartItem.quantity),
              unitPrice: Value(cartItem.product.unitPrice),
            ),
          );
        }
        return saleId;
      });

      // Clear the cart
      ref.read(cartProvider.notifier).clearCart();

      // Update state
      state = SaleSuccess(saleId);
    } catch (error) {
      // On any error, set failure
      state = SaleFailure(error.toString());
    }
  }
}


final saleNotifierProvider =
    StateNotifierProvider<SaleNotifier, SaleState>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SaleNotifier(db);
});
