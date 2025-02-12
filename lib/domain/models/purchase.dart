import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/purchase_line_item.dart';

class Purchase extends DataClass implements Insertable<Purchase> {
  final String id;
  final DateTime createdAt;
  final DateTime date;
  final String? notes;
  List<PurchaseLineItem> lineItems = [];

  Purchase({
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

  PurchasesCompanion toCompanion(bool nullToAbsent) {
    return PurchasesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      date: Value(date),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Purchase.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;

    final itemsJson = json['items'] as List<dynamic>? ?? [];
    for (var item in itemsJson) {
      item['purchaseId'] = json['id'];
    }
    final itemList = itemsJson
        .map((itemJson) =>
            PurchaseLineItem.fromJson(itemJson as Map<String, dynamic>))
        .toList();

    return Purchase(
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

  /// Converts this [Purchase] object to a json-like [Map].
  ///
  /// This is the inverse of [Purchase.fromJson].
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Purchase copyWith({
    String? id,
    DateTime? createdAt,
    Value<String?> notes = const Value.absent(),
    List<PurchaseLineItem>? lineItems,
    DateTime? date,
  }) =>
      Purchase(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        date: date ?? this.date,
        notes: notes.present ? notes.value : this.notes,
        lineItems: lineItems ?? this.lineItems,
      );
  Purchase copyWithCompanion(PurchasesCompanion data) {
    return Purchase(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Purchase(')
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
      (other is Purchase &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.notes == this.notes);
}
