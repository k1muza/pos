import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'package:pos_meat_shop/domain/providers/purchase_provider.dart';

class PurchaseDetailsPage extends ConsumerWidget {
  final String purchaseId;

  const PurchaseDetailsPage({
    Key? key,
    required this.purchaseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchase = ref.watch(purchaseProvider(purchaseId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase'),
      ),
      body: purchase.when(
        data: (data) => PurchaseDetailsView(purchase: data!),
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

class PurchaseDetailsView extends StatelessWidget {
  final Purchase purchase;
  const PurchaseDetailsView({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
