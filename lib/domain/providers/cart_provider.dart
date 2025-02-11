import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class CartItem {
  final Product product;
  double quantity; // In kg or count
  CartItem({required this.product, required this.quantity});
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(Product product, double quantity) {
    final existingIndex = state.indexWhere((c) => c.product.id == product.id);
    if (existingIndex != -1) {
      // update quantity
      final updated = [...state];
      final existing = updated[existingIndex];
      updated[existingIndex] = CartItem(
        product: existing.product,
        quantity: existing.quantity + quantity,
      );
      state = updated;
    } else {
      state = [...state, CartItem(product: product, quantity: quantity)];
    }
  }

  void removeItem(CartItem item) {
    state = state.where((c) => c.product.id != item.product.id).toList();
  }

  void updateItemQuantity(CartItem item, double quantity) {
    final existingIndex = state.indexWhere((c) => c == item);
    final updated = [...state];
    final existing = updated[existingIndex];
    updated[existingIndex] = CartItem(
      product: existing.product,
      quantity: quantity,
    );
    state = updated;
  }

  void clearCart() {
    state = [];
  }

  int get totalItems {
    return state.length;
  }

  double get totalPrice {
    double total = 0;
    for (final item in state) {
      total += item.quantity * item.product.unitPrice;
    }
    return total;
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
