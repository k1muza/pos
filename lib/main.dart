import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';
import 'presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appDatabase = AppDatabase.getInstance();

  runApp(ProviderScope(overrides: [
    // Override the appDatabaseProvider with the initialized instance
    appDatabaseProvider.overrideWithValue(appDatabase),
  ], child: const MyPosApp()));
}

class MyPosApp extends StatelessWidget {
  const MyPosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iShop',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
