import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double unitPrice;
  final bool isWeightBased;
  final VoidCallback onPressed;

  const ProductCard({
    Key? key,
    required this.name,
    required this.unitPrice,
    required this.isWeightBased,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${unitPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text(isWeightBased ? 'Weight-based' : 'Unit-based'),
          ],
        ),
      ),
    );
  }
}
