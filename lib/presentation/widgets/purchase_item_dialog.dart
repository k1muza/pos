
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/presentation/widgets/product_dropdown.dart';

class PurchaseItemDialog extends StatefulWidget {
  const PurchaseItemDialog({
    super.key,
  });

  @override
  State<PurchaseItemDialog> createState() => _PurchaseItemDialogState();
}

class _PurchaseItemDialogState extends State<PurchaseItemDialog> {
  final _formKey = GlobalKey<FormState>();

  final ProductController _productController = ProductController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitCostController = TextEditingController();

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

      Navigator.pop(context, newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Purchase Item'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductDropdownWidget(
              controller: _productController,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _quantityController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              validator: (quantity) {
                if (quantity == null || quantity.isEmpty) {
                  return 'Enter quantity';
                }

                final parsedQuantity = double.tryParse(quantity);
                if (parsedQuantity == null || parsedQuantity <= 0) {
                  return 'Enter a valid quantity';
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _unitCostController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
              decoration: const InputDecoration(
                labelText: 'Cost',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ],
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

