import 'package:flutter/material.dart';
import 'package:pos_meat_shop/presentation/pages/product_list_page.dart';
import 'package:pos_meat_shop/presentation/pages/sale_list_page.dart';
import 'sale_page.dart';
import '../widgets/primary_button.dart';
import 'purchase_list_page.dart';
import 'sync_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iPOS')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              text: 'Point of Sale',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalePage()),
                );
              },
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Sales',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SaleListPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Purchases',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PurchaseListPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Sync Sales',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SyncPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Products',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
