import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';

class ProductText extends ConsumerWidget {
  final int productId;
  final String attributeName;

  // We replicate some of the most common Text properties here:
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const ProductText({
    Key? key,
    required this.productId,
    required this.attributeName,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(productId));

    return productAsync.when(
      loading: () => const Text('Loading...'),
      error: (error, stack) => Text('Error: $error'),
      data: (product) {
        // Handle missing product
        if (product == null) {
          return Text(
            'Product not found',
            style: style,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
          );
        }

        // Map attributeName to actual product fields
        final attributes = <String, String>{
          'id': product.id.toString(),
          'name': product.name,
          'unitPrice': product.unitPrice.toStringAsFixed(2),
          'unit': product.unit,
          // Add more attributes as needed...
        };

        final value = attributes[attributeName];
        if (value == null) {
          // If you pass an attribute not in the map:
          return Text(
            'Unknown attribute: $attributeName',
            style: style,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
          );
        }

        // Display the attribute with styling and layout parameters
        return Text(
          value,
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
      },
    );
  }
}
