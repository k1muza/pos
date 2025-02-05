import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  RealColumn get unitPrice => real()();
  TextColumn get unit => text().withLength(min: 1, max: 50)();
  BoolColumn get isActive => boolean().withDefault(Constant(true))();
}

