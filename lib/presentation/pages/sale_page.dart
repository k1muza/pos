import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/cart_provider.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'package:pos_meat_shop/presentation/pages/cart_page.dart';
import 'package:pos_meat_shop/presentation/widgets/cart_icon.dart';
import 'package:pos_meat_shop/presentation/widgets/unit_input.dart';
import 'package:pos_meat_shop/presentation/widgets/weight_input.dart';

class SalePage extends ConsumerWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    final cartItems = ref.watch(cartProvider); // We'll pass this to our card.

    return Scaffold(
        appBar: AppBar(
          title: const Text('Sell Items'),
          actions: const [CartIcon()],
        ),
        body: productState.when(
            data: (products) =>
                _SaleGrid(products: products, cartItems: cartItems),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
                  child: Text('Error: $err'),
                )));
  }
}

class _SaleGrid extends StatelessWidget {
  const _SaleGrid({
    super.key,
    required this.products,
    required this.cartItems,
  });

  final List<Product> products;
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        final isInCart = cartItems.any((item) => item.product == product);
        final cartItem = cartItems.firstWhere(
          (item) => item.product == product,
          orElse: () => CartItem(product: product, quantity: 0),
        );
        return _ProductCard(
            product: product, isInCart: isInCart, cartItem: cartItem);
      },
    );
  }
}

class _ProductCard extends ConsumerWidget {
  final Product product;
  final bool? isInCart;
  final CartItem? cartItem;

  const _ProductCard({
    Key? key,
    required this.product,
    this.isInCart,
    this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartNotifier cartNotifier = ref.read(cartProvider.notifier);
    final cardColor = isInCart! ? Colors.teal : Colors.white;
    final textColor = isInCart! ? Colors.white : Colors.teal;
    return Card(
      color: cardColor,
      child: InkWell(
        onTap: () async {
          var quantity = await showDialog(
            context: context,
            barrierDismissible:
                false, // optional, so they must confirm or cancel
            builder: (BuildContext context) {
              if (product.isWeightBased) {
                return WeightCapture(onWeightEntered: (double weight) {
                  Navigator.pop(context, weight);
                });
              } else {
                return UnitCapture(onUnitEntered: (int units) {
                  Navigator.pop(context, units);
                });
              }
            },
          );

          if (quantity != null && quantity > 0) {
            cartNotifier.addItem(product, quantity.toDouble());
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const CartPage()));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name,
                style: TextStyle(color: textColor, fontSize: 18)),
            Text(
              'Price: \$${product.unitPrice.toStringAsFixed(2)}',
              style: TextStyle(color: textColor),
            ),

            // Show the quantity if the product is in the cart
            if (isInCart!)
              Text(
                'In Cart: ${cartItem!.quantity}',
                style: TextStyle(color: textColor),
              ),
          ],
        ),
      ),
    );
  }
}
