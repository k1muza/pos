import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/providers/purchase_provider.dart';
import 'package:pos_meat_shop/presentation/pages/purchase_add_page.dart';
import 'package:pos_meat_shop/presentation/pages/purchase_detail_page.dart';
import 'package:pos_meat_shop/presentation/widgets/datatable.dart';

class PurchasesTablePage extends StatelessWidget {
  const PurchasesTablePage({super.key});

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

        var data = purchases.map((purchase) {
          return Map<String, dynamic>.from({
            "id": purchase.id,
            "date": purchase.date.toIso8601String().substring(0, 10),
            "notes": purchase.notes,
            "amount": purchase.lineItems.fold(0.0, (sum, li) => sum + li.totalCost).toStringAsFixed(2),
          });
        }).toList().reversed.toList();

        return ReusableDataTable(
          // Define the columns you want to show. Ensure the keys match those in the row data.
          columns: const ["date", "amount"],
          data: data,
          onRowSelected: (data) {
            final purchaseId = data["id"];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PurchaseDetailsPage(purchaseId: purchaseId),
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
