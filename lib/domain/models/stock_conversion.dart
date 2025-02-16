
import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';

class StockConversion extends DataClass implements Insertable<StockConversion> {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String fromProductId;
  final String toProductId;
  final double quantity;
  final DateTime date;
  const StockConversion(
      {required this.id,
        required this.createdAt,
        this.updatedAt,
        required this.fromProductId,
        required this.toProductId,
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
    map['from_product_id'] = Variable<String>(fromProductId);
    map['to_product_id'] = Variable<String>(toProductId);
    map['quantity'] = Variable<double>(quantity);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  StockConversionsCompanion toCompanion(bool nullToAbsent) {
    return StockConversionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      fromProductId: Value(fromProductId),
      toProductId: Value(toProductId),
      quantity: Value(quantity),
      date: Value(date),
    );
  }

  factory StockConversion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockConversion(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      fromProductId: serializer.fromJson<String>(json['fromProductId']),
      toProductId: serializer.fromJson<String>(json['toProductId']),
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
      'fromProductId': serializer.toJson<String>(fromProductId),
      'toProductId': serializer.toJson<String>(toProductId),
      'quantity': serializer.toJson<double>(quantity),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  StockConversion copyWith(
      {String? id,
        DateTime? createdAt,
        Value<DateTime?> updatedAt = const Value.absent(),
        String? fromProductId,
        String? toProductId,
        double? quantity,
        DateTime? date}) =>
      StockConversion(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        fromProductId: fromProductId ?? this.fromProductId,
        toProductId: toProductId ?? this.toProductId,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
      );
  StockConversion copyWithCompanion(StockConversionsCompanion data) {
    return StockConversion(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      fromProductId: data.fromProductId.present
          ? data.fromProductId.value
          : this.fromProductId,
      toProductId:
      data.toProductId.present ? data.toProductId.value : this.toProductId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockConversion(')
      ..write('id: $id, ')
      ..write('createdAt: $createdAt, ')
      ..write('updatedAt: $updatedAt, ')
      ..write('fromProductId: $fromProductId, ')
      ..write('toProductId: $toProductId, ')
      ..write('quantity: $quantity, ')
      ..write('date: $date')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, updatedAt, fromProductId, toProductId, quantity, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is StockConversion &&
              other.id == this.id &&
              other.createdAt == this.createdAt &&
              other.updatedAt == this.updatedAt &&
              other.fromProductId == this.fromProductId &&
              other.toProductId == this.toProductId &&
              other.quantity == this.quantity &&
              other.date == this.date);
}
