import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/sale.dart';
import 'app_database.dart';

part 'sale_dao.g.dart';

@DriftAccessor(tables: [Sales])
class SaleDao extends DatabaseAccessor<AppDatabase> with _$SaleDaoMixin {
  final AppDatabase db;

  SaleDao(this.db) : super(db);

  // Get all sales ordered by sales date
  Future<List<Sale>> getAllSales() => (select(sales)
        ..orderBy(
            [(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)]))
      .get();

  // Stream of all sales (for reactive UI)
  Stream<List<Sale>> watchAllSales() => (select(sales)
        ..orderBy(
            [(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)]))
      .watch();

  // Stream of sale by id
  Stream<Sale?> watchSaleById(String id) =>
      (select(sales)..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();

  // Insert a sale
  Future<int> insertSale(SalesCompanion sale) {
    return into(sales).insert(sale, mode: InsertMode.insertOrReplace);
  }

  // Update a sale
  Future<bool> updateSaleData(Insertable<Sale> sale) {
    return update(sales).replace(sale);
  }

  // Delete a sale
  Future<int> deleteSale(String id) {
    return (delete(sales)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<Sale?> getSaleById(String id) {
    return (select(sales)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
