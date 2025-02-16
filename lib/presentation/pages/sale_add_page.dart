import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';
import 'package:pos_meat_shop/domain/providers/sale_line_item_provider.dart';
import 'package:pos_meat_shop/domain/providers/sale_provider.dart';
import 'package:pos_meat_shop/presentation/widgets/product_text.dart';
import 'package:pos_meat_shop/presentation/widgets/sale_item_dialog.dart';
import 'package:uuid/uuid.dart';

final saleLineItemsNotifierProvider =
    StateNotifierProvider<SaleLineItemsNotifier, List<SaleLineItem>>(
        (ref) {
  return SaleLineItemsNotifier();
});

class SaleLineItemsNotifier extends StateNotifier<List<SaleLineItem>> {
  SaleLineItemsNotifier() : super([]);

  void add(SaleLineItem item) {
    state = [...state, item];
  }

  void remove(int index) {
    state = List.from(state)..removeAt(index);
  }

  void clear() {
    state = [];
  }
}

class SaleAddPage extends ConsumerWidget {
  const SaleAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleLineItems = ref.watch(saleLineItemsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Sale'),
      ),
      body: SaleList(saleLineItems: saleLineItems),
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
        final result = await showDialog<SaleLineItem>(
          context: context,
          builder: (context) => SaleItemDialog(),
        );

        if (result != null) {
          ref.read(saleLineItemsNotifierProvider.notifier).add(result);
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
    final saleRepository = ref.watch(saleRepositoryProvider);
    final saleLineItemRepository = ref.watch(saleLineItemRepositoryProvider);

    return FloatingActionButton(
      heroTag: 'done',
      onPressed: () async {
        final id = Uuid().v4();

        await saleRepository.addSale(
          Sale(id: id, date: DateTime.now(), createdAt: DateTime.now()),
        );

        final saleLineItems = ref.watch(saleLineItemsNotifierProvider);

        for (final saleLineItem in saleLineItems) {
          await saleLineItemRepository.addSaleLineItem(
            SaleLineItemsCompanion(
              saleId: Value(id),
              productId: Value(saleLineItem.productId),
              quantity: Value(saleLineItem.quantity),
              totalPrice: Value(saleLineItem.totalPrice),
            ),
          );
        }
        ref.watch(saleLineItemsNotifierProvider.notifier).clear();
        Navigator.pop(context);
      },
      child: const Icon(Icons.check),
    );
  }
}

class SaleList extends StatelessWidget {
  final List<SaleLineItem> saleLineItems;

  const SaleList({
    super.key,
    required this.saleLineItems,
  });

  @override

  /// If the list of items is empty, shows a message saying so.
  /// Otherwise, returns a ListView of all the items.
  ///
  /// The ListView is built using [itemBuilder], which is called for each item.
  /// The key for each item is its id as a string, and onDismissed, the item is
  /// removed from the list at the given index.
  Widget build(BuildContext context) {
    if (saleLineItems.isEmpty) {
      return const Center(child: Text('No items added yet.'));
    }
    return ListView.builder(
      itemCount: saleLineItems.length,
      itemBuilder: (context, index) {
        final item = saleLineItems[index];
        return SaleListItem(
          item: item,
          index: index,
        );
      },
    );
  }
}

class SaleListItem extends ConsumerWidget {
  final SaleLineItem item;
  final int index;

  const SaleListItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(item.id.toString()),
      onDismissed: (direction) {
        ref.read(saleLineItemsNotifierProvider.notifier).remove(index);
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
            'Quantity: ${item.quantity}, Unit Cost: \$${item.unitPrice.toStringAsFixed(2)}'),
        trailing: Text('\$${item.totalPrice.toStringAsFixed(2)}'),
      ),
    );
  }
}
