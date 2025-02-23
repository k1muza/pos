import 'package:drift/drift.dart';
import 'package:pos_meat_shop/domain/models/purchase.dart';
import 'app_database.dart';

part 'purchase_dao.g.dart';

@DriftAccessor(tables: [Purchases])
class PurchaseDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseDaoMixin {
  final AppDatabase db;

  PurchaseDao(this.db) : super(db);

  // Get all purchases
  Future<List<Purchase>> getAllPurchases() => select(purchases).get();

  Stream<Purchase?> watchPurchaseById(String id) =>
      (select(purchases)..where((tbl) => tbl.id.equals(id)))
          .watchSingleOrNull();

  // Stream of all purchases (for reactive UI)
  Stream<List<Purchase>> watchAllPurchases() =>
      (select(purchases)..orderBy([(tbl) => OrderingTerm.desc(tbl.date)]))
          .watch();

  // Insert a purchase
  Future<int> insertPurchase(PurchasesCompanion purchase) {
    return into(purchases).insert(purchase, mode: InsertMode.insertOrReplace);
  }

  // Update a purchase
  Future<bool> updatePurchaseData(Insertable<Purchase> purchase) {
    return update(purchases).replace(purchase);
  }

  // Delete a purchase
  Future<int> deletePurchase(String id) {
    return (delete(purchases)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<Purchase?> getPurchaseById(String id) {
    return (select(purchases)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}
