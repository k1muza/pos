import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'package:pos_meat_shop/domain/providers/purchase_provider.dart';
import 'package:pos_meat_shop/presentation/pages/purchase_add_page.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchases'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const PurchaseListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PurchaseAddPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PurchaseListView extends ConsumerWidget {
  const PurchaseListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchasesAsync = ref.watch(purchaseNotifierProvider);
    return purchasesAsync.when(
      data: (purchases) {
        if (purchases.isEmpty) {
          return const Center(child: Text('No purchases yet'));
        }
        return ListView.builder(
          itemCount: purchases.length,
          itemBuilder: (context, index) =>
              PurchaseTile(item: purchases[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class PurchaseTile extends ConsumerWidget {
  final Purchase item;
  const PurchaseTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseRepository = ref.watch(purchaseRepositoryProvider);
    final formattedDate = DateFormat('yyyy-MM-dd').format(item.date);
    final totalCost = item.lineItems.fold<double>(
      0.0,
      (sum, li) => sum + li.totalCost,
    );

    return Dismissible(
      key: Key(item.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        purchaseRepository.deletePurchase(item.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Purchase deleted')),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ExpansionTile(
        title: Text('$formattedDate: \$${totalCost.toStringAsFixed(2)}'),
        children: item.lineItems
            .map((li) => LineItemTile(lineItem: li))
            .toList(),
      ),
    );
  }
}

class LineItemTile extends ConsumerWidget {
  final PurchaseLineItem lineItem;
  const LineItemTile({Key? key, required this.lineItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(lineItem.productId));
    return productAsync.when(
      data: (product) {
        final unit = product?.unit == 'kg' ? 'kg' : 'pieces';
        final name = product?.name ?? 'Unknown Product';
        final quantity = product?.unit == 'kg'
            ? NumberFormat('##0.00', 'en_US').format(lineItem.quantity)
            : NumberFormat('##0', 'en_US').format(lineItem.quantity);
        return ListTile(
          title: Text('$quantity $unit of $name'),
          trailing: Text('\$${NumberFormat('##0.00', 'en_US').format(lineItem.unitCost)}'),
        );
      },
      loading: () => const ListTile(title: Text('Loading product...')),
      error: (error, stack) => ListTile(title: Text('Error: $error')),
    );
  }
}
