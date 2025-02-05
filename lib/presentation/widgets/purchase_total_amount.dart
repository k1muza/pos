import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/providers/purchase_line_item_provider.dart';

class PurchaseTotalAmountWidget extends ConsumerWidget {
  final int purchaseId;
  const PurchaseTotalAmountWidget({super.key, required this.purchaseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseLineItemsAsync = ref.watch(purchaseLineItemsProvider(purchaseId));

    return purchaseLineItemsAsync.when(
      data: (items) {
        final totalAmount = items.fold<double>(0.0, (sum, item) => sum + item.unitCost * item.quantity);
        return Text('\$${totalAmount.toStringAsFixed(2)}');
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
