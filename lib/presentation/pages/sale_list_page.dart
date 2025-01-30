import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'package:pos_meat_shop/domain/providers/sale_line_item_provider.dart';
import 'package:pos_meat_shop/domain/providers/sale_provider.dart';

class SaleListPage extends StatelessWidget {
  const SaleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Sales'),
        actions: [
          IconButton(
            // Add date filter modal
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: SaleListView(),
    );
  }
}

class SaleListView extends ConsumerWidget {
  const SaleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleState = ref.read(saleNotifierProvider);

    return saleState.when(
      data: (sales) => _SaleList(sales: sales),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text('Error: $err'),
      ),
    );
  }
}

class _SaleList extends StatelessWidget {
  const _SaleList({super.key, required this.sales});

  final List<Sale> sales;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: sales
          .map(
            (sale) => SaleTile(sale: sale),
          )
          .toList(),
    );
  }
}

class SaleTile extends ConsumerWidget {
  const SaleTile({
    super.key,
    required this.sale,
  });

  final Sale sale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleLineItemsAsyncValue = ref.read(saleLineItemsProvider(sale.id));
    return saleLineItemsAsyncValue.when(
      data: (saleLineItems) {
        // You can compute a total from these items or display them in a list
        final total = saleLineItems.fold<double>(0, (acc, item) {
          return acc + (item.unitPrice * item.quantity);
        });

        return ExpansionTile(
          title: Text('Sale #${sale.id}'),
          trailing: Text('\$$total'),
          subtitle: Text(sale.createdAt.toString()),
          children: saleLineItems.map((lineItem) {
            return LineItemTile(
              lineItem: lineItem,
            );
          }).toList(),
        );
      },
      loading: () => const ListTile(
        title: Text('Loading line items...'),
      ),
      error: (err, stack) => ListTile(
        title: Text('Error loading line items: $err'),
      ),
    );
  }
}

class LineItemTile extends ConsumerWidget {
  final SaleLineItem lineItem;
  const LineItemTile({Key? key, required this.lineItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(lineItem.product));
    return productAsync.when(
      data: (product) {
        // If `product` can be null, handle that case
        final productName = product?.name ?? 'Unknown Product';
        return ListTile(
          title: Text(productName),
          subtitle: Text('Quantity: ${lineItem.quantity}'),
          trailing: Text('\$${lineItem.unitPrice.toStringAsFixed(2)}'),
        );
      },
      loading: () => const ListTile(
        title: Text('Loading product...'),
      ),
      error: (error, stack) => ListTile(
        title: Text('Error: $error'),
      ),
    );
  }
}
