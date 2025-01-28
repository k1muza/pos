import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

// Include generated file
part 'app_database.g.dart';

// Define the Products table
class Products extends Table {
  TextColumn get id => text()(); // Primary Key
  TextColumn get name => text()();
  RealColumn get unitPrice => real()();
  BoolColumn get isWeightBased => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Define the AppDatabase
@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  // Specify the location of the database file
  AppDatabase() : super(_openConnection());

  // Bump this number when changing tables and columns
  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
