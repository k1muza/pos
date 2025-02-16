import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/models/product.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart'; // for Product

class ProductController extends ValueNotifier<Product?> {
  ProductController([Product? initialValue]) : super(initialValue);

  Product? get selectedProduct => value;

  set selectedProduct(Product? newValue) {
    value = newValue;
  }
}

/// A dropdown widget that displays a list of Products and can be controlled externally.
class ProductDropdownWidget extends ConsumerStatefulWidget {
  /// Optional callback when a product is selected.
  final ValueChanged<Product?>? onChanged;

  /// Optional initial selected product.
  final Product? initialValue;

  /// External controller for the selected product.
  /// If not provided, the widget will create its own internal controller.
  final ProductController? controller;

  const ProductDropdownWidget({
    Key? key,
    this.onChanged,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  ConsumerState<ProductDropdownWidget> createState() =>
      _ProductDropdownWidgetState();
}

class _ProductDropdownWidgetState extends ConsumerState<ProductDropdownWidget> {
  late ProductController _controller;

  @override
  void initState() {
    super.initState();
    // If a controller was passed, use that. Otherwise create a new one.
    _controller = widget.controller ?? ProductController(widget.initialValue);

    // If we do want to override the controller's initial value,
    // ensure we set it here:
    if (widget.initialValue != null) {
      _controller.selectedProduct = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the list of products (AsyncValue<List<Product>>).
    final productListAsync = ref.watch(productNotifierProvider);

    return productListAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
      data: (products) {
        if (products.isEmpty) {
          return const Text('No products found');
        }

        return DropdownButtonFormField<Product>(
          // Use the controller's current value for the dropdown.
          value: _controller.selectedProduct,
          // Build list of menu items from the products list.
          items: products.map((product) {
            return DropdownMenuItem<Product>(
              value: product,
              child: Text(product.name),
            );
          }).toList(),
          // When user picks a new product, update the controller and call onChanged.
          onChanged: (selected) {
            _controller.selectedProduct = selected;
            widget.onChanged?.call(selected);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            labelText: 'Product',
          ),
        );
      },
    );
  }
}
