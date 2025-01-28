import 'package:drift/drift.dart';
import 'app_database.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  final AppDatabase db;

  ProductDao(this.db) : super(db);

  // Get all products
  Future<List<Product>> getAllProducts() => select(products).get();

  // Stream of all products (for reactive UI)
  Stream<List<Product>> watchAllProducts() => select(products).watch();

  // Insert a product
  Future<void> insertProduct(Insertable<Product> product) {
    return into(products).insert(product, mode: InsertMode.insertOrReplace);
  }

  // Update a product
  Future<bool> updateProductData(Insertable<Product> product) {
      return update(products).replace(product);
  }

  // Delete a product
  Future<int> deleteProduct(String id) {
      return (delete(products)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<Product?> getProductById(String id) {
    return (select(products)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
