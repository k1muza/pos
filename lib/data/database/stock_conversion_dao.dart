import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/stock_conversion.dart';
import 'app_database.dart';

part 'stock_conversion_dao.g.dart';

@DriftAccessor(tables: [StockConversions])
class StockConversionDao extends DatabaseAccessor<AppDatabase> with _$StockConversionDaoMixin {
  final AppDatabase db;

  StockConversionDao(this.db) : super(db);

  // Get all stockConversions
  Future<List<StockConversion>> getAllStockConversions() => select(stockConversions).get();

  // Stream of all stockConversions (for reactive UI)
  Stream<List<StockConversion>> watchAllStockConversions() => select(stockConversions).watch();

  // Insert a stockConversion
  Future<int> insertStockConversion(StockConversionsCompanion stockConversion) {
    return into(stockConversions).insert(stockConversion, mode: InsertMode.insertOrReplace);
  }

  // Update a stockConversion
  Future<bool> updateStockConversionData(Insertable<StockConversion> stockConversion) {
    return update(stockConversions).replace(stockConversion);
  }

  // Delete a stockConversion
  Future<int> deleteStockConversion(String id) {
    return (delete(stockConversions)..where((tbl) => tbl.id.equals(id))).go();
  }



  Future<StockConversion?> getStockConversionById(String id) {
    return (select(stockConversions)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}
