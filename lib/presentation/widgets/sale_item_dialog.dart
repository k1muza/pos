
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';
import 'package:pos_meat_shop/presentation/widgets/product_dropdown.dart';

class SaleItemDialog extends StatefulWidget {
  const SaleItemDialog({
    super.key,
  });

  @override
  State<SaleItemDialog> createState() => _SaleItemDialogState();
}

class _SaleItemDialogState extends State<SaleItemDialog> {
  final _formKey = GlobalKey<FormState>();

  final ProductController _productController = ProductController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();

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
      final price = double.parse(_unitPriceController.text);
      final unitPrice = price / quantity;

      // Create a new SaleLineItem
      final newItem = SaleLineItem(
        id: '', // or null if autoIncrement
        saleId: '', // Might be assigned after creating a Sale
        productId: product.id,
        quantity: quantity,
        unitPrice: unitPrice,
        totalPrice: price,
        createdAt: DateTime.now(),
      );

      Navigator.pop(context, newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Sale Item'),
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
              controller: _unitPriceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter price';
                }
                if (double.tryParse(value) == null || double.parse(value) <= 0) {
                  return 'Enter a valid price';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Price',
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

