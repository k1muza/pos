import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/sale_line_item.dart';

class Sale extends DataClass implements Insertable<Sale> {
  final String id;
  final DateTime createdAt;
  final DateTime date;
  final String? notes;
  List<SaleLineItem> lineItems = [];

  Sale({
    required this.id,
    required this.createdAt,
    required this.date,
    this.notes,
    this.lineItems = const [],
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SalesCompanion toCompanion(bool nullToAbsent) {
    return SalesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      date: Value(date),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Sale.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;

    final itemsJson = json['items'] as List<dynamic>? ?? [];
    for (var item in itemsJson) {
      item['saleId'] = json['id'];
    }
    final itemList = itemsJson
        .map((itemJson) =>
            SaleLineItem.fromJson(itemJson as Map<String, dynamic>))
        .toList();

    return Sale(
      id: serializer.fromJson<String>(json['id']),
      date: json.containsKey('date')
          ? serializer.fromJson<DateTime>(json['date'])
          : DateTime.now(),
      createdAt: json.containsKey('createdAt')
          ? serializer.fromJson<DateTime>(json['createdAt'])
          : DateTime.now(),
      lineItems: itemList,
    );
  }

  @override

  /// Converts this [Sale] object to a json-like [Map].
  ///
  /// This is the inverse of [Sale.fromJson].
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Sale copyWith({
    String? id,
    DateTime? createdAt,
    Value<String?> notes = const Value.absent(),
    List<SaleLineItem>? lineItems,
    DateTime? date,
  }) =>
      Sale(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        date: date ?? this.date,
        notes: notes.present ? notes.value : this.notes,
        lineItems: lineItems ?? this.lineItems,
      );
  Sale copyWithCompanion(SalesCompanion data) {
    return Sale(
      id: data.id.present ? data.id.value : id,
      createdAt: data.createdAt.present ? data.createdAt.value : createdAt,
      date: data.date.present ? data.date.value : date,
      notes: data.notes.present ? data.notes.value : notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sale(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sale &&
          other.id == id &&
          other.createdAt == createdAt &&
          other.notes == notes);
}
