import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/repos/I_product_repo.dart';
import 'package:pos_meat_shop/data/repos/product_repository.dart';
import 'package:pos_meat_shop/domain/models/product.dart';


// For a quick approach, define a repository provider:
final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRepository(); // you might pass DB services or APIs if needed
});

// Then define a FutureProvider to fetch products:
final productListProvider = FutureProvider<List<Product>>((ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.fetchProducts();
});
