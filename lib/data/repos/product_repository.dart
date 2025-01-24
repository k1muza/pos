import 'package:pos_meat_shop/data/repos/I_product_repo.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class ProductRepository implements IProductRepository {
  // If you have a local database or an API, inject them here
  // final YourDbService _dbService;

  ProductRepository(); // or pass dependencies in the constructor

  @override
  Future<List<Product>> fetchProducts() async {
    // This could be an API call or a DB query. For now, let’s mock:
    await Future.delayed(const Duration(seconds: 1)); // simulating network delay
    return [
      const Product(id: '1', name: 'Beef', unitPrice: 10.0, isWeightBased: true),
      const Product(id: '2', name: 'Milk', unitPrice: 2.0, isWeightBased: false),
      const Product(id: '3', name: 'Chicken', unitPrice: 8.0, isWeightBased: true),
      const Product(id: '4', name: 'BBQ', unitPrice: 1.0, isWeightBased: false),
      const Product(id: '5', name: 'Pork', unitPrice: 12.0, isWeightBased: true),
      const Product(id: '6', name: 'Cascade', unitPrice: 5.0, isWeightBased: false),
    ];
  }
}
