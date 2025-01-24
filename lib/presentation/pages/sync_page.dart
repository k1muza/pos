import 'package:flutter/material.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Sales'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Future: implement syncing with server
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sales synced (mock)!')),
            );
          },
          child: const Text('Sync Now'),
        ),
      ),
    );
  }
}
