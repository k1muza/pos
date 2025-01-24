import 'package:flutter/material.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Purchase'),
      ),
      body: Center(
        child: Text(
          'Coming soon: form to add new stock (e.g., 50 kg beef).',
        ),
      ),
    );
  }
}
