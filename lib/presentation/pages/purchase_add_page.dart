import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/presentation/widgets/product_dropdown.dart';
import 'package:pos_meat_shop/presentation/widgets/product_text.dart';

class PurchaseAddPage extends StatefulWidget {
  const PurchaseAddPage({super.key});

  @override
  State<PurchaseAddPage> createState() => _PurchaseAddPageState();
}

class _PurchaseAddPageState extends State<PurchaseAddPage> {
  // Keep a local list of added items
  final List<PurchaseLineItem> _addedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Purchase'),
        actions: [
          AddPurchaseItemButton(
            onAddItem: (PurchaseLineItem item) {
              setState(() {
                _addedItems.add(item);
              });
            },
          ),
        ],
      ),
      body: PurchaseList(
        items: _addedItems,
        onRemoveItem: (int index) {
          setState(() {
            _addedItems.removeAt(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _savePurchase,
        child: const Icon(Icons.check),
      ),
    );
  }

  void _savePurchase() {
    // In a real app, you might:
    // 1) Insert these line items into the DB,
    // 2) Create a Purchase entry,
    // 3) Navigate away, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('TODO: Save Purchase')),
    );
  }
}


class AddPurchaseItemButton extends StatelessWidget {
  final Function(PurchaseLineItem) onAddItem;

  const AddPurchaseItemButton({
    Key? key,
    required this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () async {
        final result = await showDialog<PurchaseLineItem>(
          context: context,
          builder: (BuildContext context) {
            return PurchaseItemDialog(onAddItem: onAddItem);
          },
        );

        // If user actually submitted an item, add it to the list
        if (result != null) {
          onAddItem(result);
        }
      },
    );
  }
}

class PurchaseList extends StatelessWidget {
  final List<PurchaseLineItem> items;
  final Function(int) onRemoveItem;

  const PurchaseList({
    Key? key,
    required this.items,
    required this.onRemoveItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No items added yet.'));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return PurchaseListItem(
          item: item,
          onDismissed: () => onRemoveItem(index),
        );
      },
    );
  }
}


class PurchaseListItem extends StatelessWidget {
  final PurchaseLineItem item;
  final VoidCallback onDismissed;

  const PurchaseListItem({
    Key? key,
    required this.item,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id.toString()),
      onDismissed: (direction) {
        onDismissed();
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


class PurchaseItemDialog extends StatefulWidget {
  final Function(PurchaseLineItem) onAddItem;

  const PurchaseItemDialog({
    Key? key,
    required this.onAddItem,
  }) : super(key: key);

  @override
  State<PurchaseItemDialog> createState() => _PurchaseItemDialogState();
}

class _PurchaseItemDialogState extends State<PurchaseItemDialog> {
  final _formKey = GlobalKey<FormState>();

  final ProductController _productController = ProductController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitCostController = TextEditingController();

  @override
  void dispose() {
    _productController.dispose();
    _quantityController.dispose();
    _unitCostController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final product = _productController.value;
      if (product == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a product.')),
        );
        return;
      }

      final quantity = double.parse(_quantityController.text);
      final cost = double.parse(_unitCostController.text);
      final unitCost = cost / quantity;

      // Create a new PurchaseLineItem
      final newItem = PurchaseLineItem(
        id: 0, // or null if autoIncrement
        purchaseId: 0, // Might be assigned after creating a Purchase
        productId: product.id,
        quantity: quantity,
        unitCost: unitCost,
        totalCost: cost,
        createdAt: DateTime.now(),
        remoteId: null,
      );

      widget.onAddItem(newItem);
      Navigator.pop(context, newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Purchase Item'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ProductDropdownWidget(
                controller: _productController,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _quantityController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter quantity';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Enter a valid quantity';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Quantity',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _unitCostController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter cost';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Enter a valid cost';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Cost',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}

