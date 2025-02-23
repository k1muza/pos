import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';
import 'package:pos_meat_shop/domain/providers/sale_provider.dart';

import '../widgets/datatable.dart';

class SaleDetailsPage extends ConsumerWidget {
  final String saleId;

  const SaleDetailsPage({
    Key? key,
    required this.saleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sale = ref.watch(saleProvider(saleId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Sale'),
      ),
      body: sale.when(
        data: (data) => SaleDetailsView(sale: data!),
        error: (error, stackTrace) => Center(
          child: Text('Error'),
        ),
        loading: () => Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}

class SaleDetailsView extends StatelessWidget {
  final Sale sale;
  const SaleDetailsView({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    var data = sale.lineItems
        .map((item) {
      return Map<String, dynamic>.from({
        "id": item.id,
        "product": item.product!.name,
        "quantity": item.quantity,
        "amount": item.totalPrice.toStringAsFixed(2),
      });
    })
        .toList()
        .reversed
        .toList();
    return ReusableDataTable(
      // Define the columns you want to show. Ensure the keys match those in the row data.
      columns: const ["product", "quantity", "amount"],
      data: data,
    );
  }
}
