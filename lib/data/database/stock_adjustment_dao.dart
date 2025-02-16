import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/stock_adjustment.dart';
import 'app_database.dart';

part 'stock_adjustment_dao.g.dart';

@DriftAccessor(tables: [StockAdjustments])
class StockAdjustmentDao extends DatabaseAccessor<AppDatabase> with _$StockAdjustmentDaoMixin {
  final AppDatabase db;

  StockAdjustmentDao(this.db) : super(db);

  // Get all stockAdjustments
  Future<List<StockAdjustment>> getAllStockAdjustments() => select(stockAdjustments).get();

  // Stream of all stockAdjustments (for reactive UI)
  Stream<List<StockAdjustment>> watchAllStockAdjustments() => select(stockAdjustments).watch();

  // Insert a stockAdjustment
  Future<int> insertStockAdjustment(StockAdjustmentsCompanion stockAdjustment) {
    return into(stockAdjustments).insert(stockAdjustment, mode: InsertMode.insertOrReplace);
  }

  // Update a stockAdjustment
  Future<bool> updateStockAdjustmentData(Insertable<StockAdjustment> stockAdjustment) {
    return update(stockAdjustments).replace(stockAdjustment);
  }

  // Delete a stockAdjustment
  Future<int> deleteStockAdjustment(String id) {
    return (delete(stockAdjustments)..where((tbl) => tbl.id.equals(id))).go();
  }



  Future<StockAdjustment?> getStockAdjustmentById(String id) {
    return (select(stockAdjustments)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
