import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/cart_provider.dart';
import 'package:pos_meat_shop/domain/providers/sale_line_item_provider.dart';
import 'package:pos_meat_shop/domain/providers/sale_provider.dart';
import 'package:uuid/uuid.dart';

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
  final String saleId;
  const SaleSuccess(this.saleId);
}

class SaleFailure extends SaleState {
  final String error;
  const SaleFailure(this.error);
}

class SaleNotifier extends StateNotifier<SaleState> {
  SaleNotifier() : super(const SaleInitial());

  Future<void> processSale(WidgetRef ref) async {
    // If the UI is re-triggered while loading, you might handle it
    // or simply do nothing. Here, let's reset to loading.
    state = const SaleLoading();

    final cartItems = ref.read(cartProvider);
    final saleRepository = ref.read(saleRepositoryProvider);
    final saleLineItemRepository = ref.read(saleLineItemRepositoryProvider);

    if (cartItems.isEmpty) {
      // Nothing to sell, but let's consider that a 'failure' or do nothing
      state = const SaleFailure("Cart is empty");
    }

    try {
      var id = Uuid().v4();

      await saleRepository.addSale(
        Sale(id: id, createdAt: DateTime.now()),
      );

      for (final cartItem in cartItems) {
        saleLineItemRepository.addSaleLineItem(
          SaleLineItemsCompanion(
            saleId: Value(id),
            productId: Value(cartItem.product.id),
            quantity: Value(cartItem.quantity),
            totalPrice: Value(cartItem.product.unitPrice * cartItem.quantity),
          ),
        );
      }
      // Clear the cart
      ref.read(cartProvider.notifier).clearCart();

      // Update state
      state = SaleSuccess(id);
    } catch (error) {
      // On any error, set failure
      state = SaleFailure(error.toString());
    }
  }
}

final saleNotifierProvider =
    StateNotifierProvider<SaleNotifier, SaleState>((ref) {
  return SaleNotifier();
});
