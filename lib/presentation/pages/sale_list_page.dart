import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'package:pos_meat_shop/domain/providers/sale_provider.dart';
import 'package:pos_meat_shop/presentation/pages/sale_add_page.dart';

class SaleListPage extends StatelessWidget {
  const SaleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const SaleListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SaleAddPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SaleListView extends ConsumerWidget {
  const SaleListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesAsync = ref.watch(saleNotifierProvider);
    return salesAsync.when(
      data: (sales) {
        if (sales.isEmpty) {
          return const Center(child: Text('No sales yet'));
        }
        return ListView.builder(
          itemCount: sales.length,
          itemBuilder: (context, index) =>
              SaleTile(item: sales[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class SaleTile extends ConsumerWidget {
  final Sale item;
  const SaleTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleRepository = ref.watch(saleRepositoryProvider);
    final formattedDate = DateFormat('yyyy-MM-dd').format(item.date);
    final totalPrice = item.lineItems.fold<double>(
      0.0,
      (sum, li) => sum + li.totalPrice,
    );

    return Dismissible(
      key: Key(item.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        saleRepository.deleteSale(item.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sale deleted')),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ExpansionTile(
        title: Text('$formattedDate: \$${totalPrice.toStringAsFixed(2)}'),
        children: item.lineItems
            .map((li) => LineItemTile(lineItem: li))
            .toList(),
      ),
    );
  }
}

class LineItemTile extends ConsumerWidget {
  final SaleLineItem lineItem;
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
          trailing: Text('\$${NumberFormat('##0.00', 'en_US').format(lineItem.unitPrice)}'),
        );
      },
      loading: () => const ListTile(title: Text('Loading product...')),
      error: (error, stack) => ListTile(title: Text('Error: $error')),
    );
  }
}
