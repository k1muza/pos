import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'package:pos_meat_shop/domain/providers/purchase_provider.dart';
import 'package:pos_meat_shop/presentation/pages/purchase_add_page.dart';
import 'package:pos_meat_shop/presentation/widgets/purchase_total_amount.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchases'), actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PurchaseAddPage()),
            );
          },
          icon: Icon(Icons.add),
        ),
      ]),
      body: PurchaseListView(),
    );
  }
}

class PurchaseListView extends ConsumerWidget {
  const PurchaseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseNotifier = ref.watch(purchaseNotifierProvider);

    return purchaseNotifier.when(
      data: (items) => items.isNotEmpty
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return PurchaseTile(item: items[index]);
              },
            )
          : const Center(child: Text('No purchases yet')),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class PurchaseTile extends StatelessWidget {
  final Purchase item;
  const PurchaseTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   title: Text('Purchase #${item.id.toString()}'),
    //   subtitle: Text(Jiffy.parseFromDateTime(item.createdAt).fromNow()),
    //   trailing: PurchaseTotalAmountWidget(purchaseId: item.id),
    // );
    return ExpansionTile(
      title: Text('Purchase #${item.id.toString()}'),
      subtitle: Text(Jiffy.parseFromDateTime(item.createdAt).fromNow()),
      trailing: PurchaseTotalAmountWidget(purchaseId: item.id),
      children: item.lineItems!.map((lineItem) => Text(lineItem.productId)).toList(),
    );
  }
}
