import 'package:flutter/material.dart';
import 'package:pos_meat_shop/presentation/pages/purchase_add_page.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchases'), actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PurchaseAddPage()),
            );
          },
          icon: Icon(Icons.add),
        ),
      ]),
      body: Center(
        child: Text(
          'Purchase List',
        ),
      ),
    );
  }
}
