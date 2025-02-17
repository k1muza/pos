import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/providers/stock_conversion_provider.dart';
import 'package:pos_meat_shop/presentation/pages/stock_conversion_details_page.dart';
import 'package:pos_meat_shop/presentation/widgets/datatable.dart';

class StockConversionTablePage extends StatelessWidget {
  const StockConversionTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StockConversion'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const StockConversionListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) => const StockConversionAddPage()),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StockConversionListView extends ConsumerWidget {
  const StockConversionListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StockConversionAsync = ref.watch(stockConversionNotifierProvider);
    return StockConversionAsync.when(
      data: (StockConversion) {
        if (StockConversion.isEmpty) {
          return const Center(child: Text('No StockConversion yet'));
        }

        var data = StockConversion.map((stockConversion) {
          return Map<String, dynamic>.from({
            "id": stockConversion.id,
            "date": stockConversion.date.toIso8601String().substring(0, 10),
          });
        }).toList();

        return ReusableDataTable(
          // Define the columns you want to show. Ensure the keys match those in the row data.
          columns: const ["date", "amount"],
          data: data,
          onRowSelected: (data) {
            final stockConversionId = data["id"];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StockConversionDetailsPage(stockConversionId: stockConversionId),
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
