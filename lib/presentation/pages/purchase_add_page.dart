import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'package:pos_meat_shop/domain/providers/purchase_line_item_provider.dart';
import 'package:pos_meat_shop/domain/providers/purchase_provider.dart';
import 'package:pos_meat_shop/presentation/widgets/product_text.dart';
import 'package:pos_meat_shop/presentation/widgets/purchase_item_dialog.dart';

final purchaseLineItemsNotifierProvider =
    StateNotifierProvider<PurchaseLineItemsNotifier, List<PurchaseLineItem>>(
        (ref) {
  return PurchaseLineItemsNotifier();
});

class PurchaseLineItemsNotifier extends StateNotifier<List<PurchaseLineItem>> {
  PurchaseLineItemsNotifier() : super([]);

  void add(PurchaseLineItem item) {
    state = [...state, item];
  }

  void remove(int index) {
    state = List.from(state)..removeAt(index);
  }

  void clear() {
    state = [];
  }
}

class PurchaseAddPage extends ConsumerWidget {
  const PurchaseAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseLineItems = ref.watch(purchaseLineItemsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Purchase'),
      ),
      body: PurchaseList(purchaseLineItems: purchaseLineItems),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionAddButton(),
          const SizedBox(height: 16),
          FloatingActionDoneButton(),
        ],
      ),
    );
  }
}

class FloatingActionAddButton extends ConsumerWidget {
  const FloatingActionAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      heroTag: 'add',
      onPressed: () async {
        final result = await showDialog<PurchaseLineItem>(
          context: context,
          builder: (context) => PurchaseItemDialog(),
        );

        if (result != null) {
          ref.read(purchaseLineItemsNotifierProvider.notifier).add(result);
        }
      },
      child: const Icon(Icons.add),
    );
  }
}

class FloatingActionDoneButton extends ConsumerWidget {
  const FloatingActionDoneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseDao = ref.watch(purchaseDaoProvider);
    final purchaseLineItemDao = ref.watch(purchaseLineItemDaoProvider);
    final db = AppDatabase.getInstance();

    return FloatingActionButton(
      heroTag: 'done',
      onPressed: () async {
        // await db.transaction(() async {
        final newPurchaseId = await purchaseDao.insertPurchase(
          PurchasesCompanion(),
        );

        final purchaseLineItems = ref.watch(purchaseLineItemsNotifierProvider);

        for (final purchaseLineItem in purchaseLineItems) {
          await purchaseLineItemDao.insertPurchaseLineItem(
            PurchaseLineItemsCompanion(
              purchaseId: Value(newPurchaseId),
              productId: Value(purchaseLineItem.productId),
              quantity: Value(purchaseLineItem.quantity),
              totalCost: Value(purchaseLineItem.totalCost),
            ),
          );
        }
        ref.watch(purchaseLineItemsNotifierProvider.notifier).clear();
        Navigator.pop(context);
        // });
      },
      child: const Icon(Icons.check),
    );
  }
}

class PurchaseList extends StatelessWidget {
  final List<PurchaseLineItem> purchaseLineItems;

  const PurchaseList({
    super.key,
    required this.purchaseLineItems,
  });

  @override

  /// If the list of items is empty, shows a message saying so.
  /// Otherwise, returns a ListView of all the items.
  ///
  /// The ListView is built using [itemBuilder], which is called for each item.
  /// The key for each item is its id as a string, and onDismissed, the item is
  /// removed from the list at the given index.
  Widget build(BuildContext context) {
    if (purchaseLineItems.isEmpty) {
      return const Center(child: Text('No items added yet.'));
    }
    return ListView.builder(
      itemCount: purchaseLineItems.length,
      itemBuilder: (context, index) {
        final item = purchaseLineItems[index];
        return PurchaseListItem(
          item: item,
          index: index,
        );
      },
    );
  }
}

class PurchaseListItem extends ConsumerWidget {
  final PurchaseLineItem item;
  final int index;

  const PurchaseListItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(item.id.toString()),
      onDismissed: (direction) {
        ref.read(purchaseLineItemsNotifierProvider.notifier).remove(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${item.productId} dismissed')),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: ProductText(productId: item.productId, attributeName: 'name'),
        subtitle: Text(
            'Quantity: ${item.quantity}, Unit Cost: \$${item.unitCost.toStringAsFixed(2)}'),
        trailing: Text('\$${item.totalCost.toStringAsFixed(2)}'),
      ),
    );
  }
}
