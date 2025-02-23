import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/providers/sale_provider.dart';
import 'package:pos_meat_shop/presentation/pages/sale_add_page.dart';
import 'package:pos_meat_shop/presentation/pages/sale_detail_page.dart';
import 'package:pos_meat_shop/presentation/widgets/datatable.dart';

class SalesTablePage extends StatelessWidget {
  const SalesTablePage({super.key});

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

        var data = sales.map((sale) {
          return Map<String, dynamic>.from({
            "id": sale.id,
            "date": sale.date.toIso8601String().substring(0, 10),
            "notes": sale.notes,
            "amount": sale.lineItems.fold(0.0, (sum, li) => sum + li.totalPrice).toStringAsFixed(2),
          });
        }).toList();

        return ReusableDataTable(
          // Define the columns you want to show. Ensure the keys match those in the row data.
          columns: const ["date", "amount"],
          data: data,
          onRowSelected: (data) {
            final saleId = data["id"];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SaleDetailsPage(saleId: saleId),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
