import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'package:pos_meat_shop/presentation/pages/product_edit_page.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductEditPage(product: null),
                ),
              );
            },
          ),
        ],
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
      data: (products) => _ProductList(products: products),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err'),)
    );
  }
}

class _ProductList extends StatelessWidget {
  final List<Product> products;

  const _ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _ProductListItem(product: products[index]);
      },
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final Product product;

  const _ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id),
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
              builder: (_) => ProductEditPage(product: product,),
            ),
          );
        },
      ),
    );
  }
}
