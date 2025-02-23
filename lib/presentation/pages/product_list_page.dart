import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/domain/models/product.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'package:pos_meat_shop/presentation/pages/product_edit_page.dart';

import '../widgets/datatable.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductEditPage(product: null),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ProductListView(),
    );
  }
}

class ProductListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    return productState.when(
        data: (products) => products.isNotEmpty
            ? _ProductList(products: products)
            : Center(
                child: Text('No products yet'),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
              child: Text('Error: $err'),
            ));
  }
}

class _ProductList extends StatelessWidget {
  final List<Product> products;

  const _ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    var data = products.map((product) {
      return Map<String, dynamic>.from({
        "id": product.id,
        "name": product.name,
        "unitPrice": product.unitPrice,
      });
    });
    return ReusableDataTable(
      // Define the columns you want to show. Ensure the keys match those in the row data.
      columns: const ["id", "name", "unitPrice"],
      data: data.toList(),
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final Product product;

  const _ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
      ),
      child: ListTile(
        title: Text(product.name),
        trailing: Text(product.unitPrice.toString()),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductEditPage(
                product: product,
              ),
            ),
          );
        },
      ),
    );
  }
}
