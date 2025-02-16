
import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';

class StockAdjustment extends DataClass implements Insertable<StockAdjustment> {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String productId;
  final double quantity;
  final DateTime date;
  const StockAdjustment(
      {required this.id,
        required this.createdAt,
        this.updatedAt,
        required this.productId,
        required this.quantity,
        required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<double>(quantity);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  StockAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return StockAdjustmentsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      productId: Value(productId),
      quantity: Value(quantity),
      date: Value(date),
    );
  }

  factory StockAdjustment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockAdjustment(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  StockAdjustment copyWith(
      {String? id,
        DateTime? createdAt,
        Value<DateTime?> updatedAt = const Value.absent(),
        String? productId,
        double? quantity,
        DateTime? date}) =>
      StockAdjustment(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
      );
  StockAdjustment copyWithCompanion(StockAdjustmentsCompanion data) {
    return StockAdjustment(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockAdjustment(')
      ..write('id: $id, ')
      ..write('createdAt: $createdAt, ')
      ..write('updatedAt: $updatedAt, ')
      ..write('productId: $productId, ')
      ..write('quantity: $quantity, ')
      ..write('date: $date')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, productId, quantity, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is StockAdjustment &&
              other.id == this.id &&
              other.createdAt == this.createdAt &&
              other.updatedAt == this.updatedAt &&
              other.productId == this.productId &&
              other.quantity == this.quantity &&
              other.date == this.date);
}
