import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final DateTime createdAt;
  final String name;
  final double unitPrice;
  final String unit;
  final bool? isWeightBased;
  final bool? isActive;
  final String? supplierId;
  const Product(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.unitPrice,
      required this.unit,
      this.isWeightBased,
      this.isActive,
      this.supplierId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['unit_price'] = Variable<double>(unitPrice);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<bool>(isActive);
    }
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<String>(supplierId);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      unitPrice: Value(unitPrice),
      unit: Value(unit),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive!),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      createdAt: json.containsKey('createdAt') ? serializer.fromJson<DateTime>(json['createdAt']) : DateTime.now(),
      name: serializer.fromJson<String>(json['name']),
      unitPrice: serializer.fromJson<double>(double.parse(json['unitPrice'] ?? '0.00')),
      unit: json.containsKey('unit') ? serializer.fromJson<String>(json['unit']) : 'pieces',
      isWeightBased: json.containsKey('isWeightBased') ? serializer.fromJson<bool>(json['isWeightBased']) : null,
      isActive: json.containsKey('isActive') ? serializer.fromJson<bool>(json['isActive']) : null,
      supplierId: json.containsKey('supplierId') ? serializer.fromJson<String?>(json['supplierId']) : null,
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'unit': serializer.toJson<String>(unit),
      'isWeightBased': serializer.toJson<bool?>(isWeightBased),
      'isActive': serializer.toJson<bool?>(isActive),
      'supplierId': serializer.toJson<String?>(supplierId),
    };
  }

  Product copyWith(
          {String? id,
          DateTime? createdAt,
          String? name,
          double? unitPrice,
          String? unit,
          bool? isWeightBased,
          bool? isActive,
          Value<String?> supplierId = const Value.absent()}) =>
      Product(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        unitPrice: unitPrice ?? this.unitPrice,
        unit: unit ?? this.unit,
        isWeightBased: isWeightBased ?? this.isWeightBased,
        isActive: isActive ?? this.isActive,
        supplierId: supplierId.present ? supplierId.value : this.supplierId,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unit: $unit, ')
          ..write('isWeightBased: $isWeightBased, ')
          ..write('isActive: $isActive, ')
          ..write('supplierId: $supplierId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, name, unitPrice,
      unit, isWeightBased, isActive, supplierId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.unitPrice == this.unitPrice &&
          other.unit == this.unit &&
          other.isWeightBased == this.isWeightBased &&
          other.isActive == this.isActive &&
          other.supplierId == this.supplierId);
}
