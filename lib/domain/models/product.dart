class Product {
  final String id;
  final String name;
  final double unitPrice;
  final bool isWeightBased;

  const Product({
    required this.id,
    required this.name,
    required this.unitPrice,
    required this.isWeightBased,
  });

  static Product empty() {
    return const Product(id: '', name: '', unitPrice: 0.0, isWeightBased: false);
  }
}
