import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/providers/cart_provider.dart';
import 'package:pos_meat_shop/domain/services/sale_service.dart';
import 'package:pos_meat_shop/presentation/widgets/unit_input.dart';
import 'package:pos_meat_shop/presentation/widgets/weight_input.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartProvider.notifier).totalPrice;
    CartNotifier cartNotifier = ref.read(cartProvider.notifier);

    final saleState = ref.watch(saleNotifierProvider);

    ref.listen<SaleState>(saleNotifierProvider, (previous, next) {
      if (next is SaleSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sale completed. SaleId: ${next.saleId}')),
        );
        Navigator.pop(context);
      } else if (next is SaleFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sale failed: ${next.error}')),
        );
      }
      // If you want to handle loading, you can also do so.
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            child: const Icon(Icons.add),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'clear',
            child: const Icon(Icons.clear),
            onPressed: () {
              cartNotifier.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cart Cleared!')),
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 124),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartListItem(item: item, cartNotifier: cartNotifier);
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total:', style: TextStyle(fontSize: 20)),
                  Text('\$${cartTotal.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Start the sale process
                ref.read(saleNotifierProvider.notifier).processSale(ref);
              },
              child: saleState is SaleLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text('Print Payment Receipt'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.item,
    required this.cartNotifier,
  });

  final CartItem item;
  final CartNotifier cartNotifier;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.product.id.toString()),
      onDismissed: (direction) {
        cartNotifier.removeItem(item);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(item.product.name.substring(0, 1)),
        ),
        title: Text(item.product.name),
        subtitle: Text(
          '${item.quantity} ${item.product.unit} x \$${item.product.unitPrice.toStringAsFixed(2)}',
        ),
        trailing: Text(
            '\$${(item.quantity * item.product.unitPrice).toStringAsFixed(2)}'),
        onTap: () async {
          var quantity = await showDialog(
              context: context,
              barrierDismissible:
                  false, // optional, so they must confirm or cancel
              builder: (BuildContext context) {
                if (item.product.isWeightBased) {
                  return WeightCapture(onWeightEntered: (double weight) {
                    Navigator.pop(context, weight);
                  });
                } else {
                  return UnitCapture(onUnitEntered: (int units) {
                    Navigator.pop(context, units);
                  });
                }
              });
          cartNotifier.updateItemQuantity(item, quantity.toDouble());
        },
      ),
    );
  }
}
