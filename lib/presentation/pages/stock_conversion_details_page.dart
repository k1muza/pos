import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';
import 'package:pos_meat_shop/domain/providers/stock_conversion_provider.dart';

class StockConversionDetailsPage extends ConsumerWidget {
  final String stockConversionId;

  const StockConversionDetailsPage({
    Key? key,
    required this.stockConversionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockConversion = ref.watch(stockConversionProvider(stockConversionId));

    return Scaffold(
      appBar: AppBar(
        title: Text('StockConversion'),
      ),
      body: stockConversion.when(
        data: (data) => StockConversionDetailsView(stockConversion: data!),
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

class StockConversionDetailsView extends StatelessWidget {
  final StockConversion stockConversion;
  const StockConversionDetailsView({super.key, required this.stockConversion});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
