import 'package:drift/drift.dart';
import 'app_database.dart';

part 'sale_dao.g.dart';

@DriftAccessor(tables: [Sales])
class SaleDao extends DatabaseAccessor<AppDatabase> with _$SaleDaoMixin {
  final AppDatabase db;

  SaleDao(this.db) : super(db);

  // Get all sales
  Future<List<Sale>> getAllSales() => select(sales).get();

  // Stream of all sales (for reactive UI)
  Stream<List<Sale>> watchAllSales() => select(sales).watch();

  // Insert a sale
  Future<int> insertSale(SalesCompanion sale) {
    return into(sales).insert(sale, mode: InsertMode.insertOrReplace);
  }

  // Update a sale
  Future<bool> updateSaleData(Insertable<Sale> sale) {
    return update(sales).replace(sale);
  }

  // Delete a sale
  Future<int> deleteSale(int id) {
    return (delete(sales)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<Sale?> getSaleById(int id) {
    return (select(sales)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
