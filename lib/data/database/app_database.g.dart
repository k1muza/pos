// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, Supplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(Insertable<Supplier> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Supplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplier(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class SuppliersCompanion extends UpdateCompanion<Supplier> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<int> rowid;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuppliersCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Supplier> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuppliersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String>? name,
      Value<int>? rowid}) {
    return SuppliersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isWeightBasedMeta =
      const VerificationMeta('isWeightBased');
  @override
  late final GeneratedColumn<bool> isWeightBased = GeneratedColumn<bool>(
      'is_weight_based', aliasedName, false,
      generatedAs: GeneratedAs(unit.equals('kg'), false),
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_weight_based" IN (0, 1))'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: Constant(true));
  static const VerificationMeta _supplierIdMeta =
      const VerificationMeta('supplierId');
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
      'supplier_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES suppliers (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        name,
        unitPrice,
        unit,
        isWeightBased,
        isActive,
        supplierId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('is_weight_based')) {
      context.handle(
          _isWeightBasedMeta,
          isWeightBased.isAcceptableOrUnknown(
              data['is_weight_based']!, _isWeightBasedMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
          _supplierIdMeta,
          supplierId.isAcceptableOrUnknown(
              data['supplier_id']!, _supplierIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      isWeightBased: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_weight_based'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      supplierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_id']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<double> unitPrice;
  final Value<String> unit;
  final Value<bool> isActive;
  final Value<String?> supplierId;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unit = const Value.absent(),
    this.isActive = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required double unitPrice,
    required String unit,
    this.isActive = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        unitPrice = Value(unitPrice),
        unit = Value(unit);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<double>? unitPrice,
    Expression<String>? unit,
    Expression<bool>? isActive,
    Expression<String>? supplierId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (unit != null) 'unit': unit,
      if (isActive != null) 'is_active': isActive,
      if (supplierId != null) 'supplier_id': supplierId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String>? name,
      Value<double>? unitPrice,
      Value<String>? unit,
      Value<bool>? isActive,
      Value<String?>? supplierId,
      Value<int>? rowid}) {
    return ProductsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      unitPrice: unitPrice ?? this.unitPrice,
      unit: unit ?? this.unit,
      isActive: isActive ?? this.isActive,
      supplierId: supplierId ?? this.supplierId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unit: $unit, ')
          ..write('isActive: $isActive, ')
          ..write('supplierId: $supplierId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SalesTable extends Sales with TableInfo<$SalesTable, Sale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, notes, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales';
  @override
  VerificationContext validateIntegrity(Insertable<Sale> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Sale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sale(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $SalesTable createAlias(String alias) {
    return $SalesTable(attachedDatabase, alias);
  }
}

class SalesCompanion extends UpdateCompanion<Sale> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> notes;
  final Value<DateTime> date;
  final Value<int> rowid;
  const SalesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SalesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime date,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date);
  static Insertable<Sale> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? notes,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (notes != null) 'notes': notes,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SalesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String?>? notes,
      Value<DateTime>? date,
      Value<int>? rowid}) {
    return SalesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('notes: $notes, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SaleLineItemsTable extends SaleLineItems
    with TableInfo<$SaleLineItemsTable, SaleLineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleLineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
      'sale_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sales (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      check: () => ComparableExpr(quantity).isBiggerThanValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
      'unit_price', aliasedName, false,
      generatedAs: GeneratedAs(totalPrice / quantity, false),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        productId,
        saleId,
        quantity,
        totalPrice,
        unitPrice
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_line_items';
  @override
  VerificationContext validateIntegrity(Insertable<SaleLineItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(_saleIdMeta,
          saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta));
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SaleLineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleLineItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      saleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sale_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_price'])!,
    );
  }

  @override
  $SaleLineItemsTable createAlias(String alias) {
    return $SaleLineItemsTable(attachedDatabase, alias);
  }
}

class SaleLineItemsCompanion extends UpdateCompanion<SaleLineItem> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> productId;
  final Value<String> saleId;
  final Value<double> quantity;
  final Value<double> totalPrice;
  final Value<int> rowid;
  const SaleLineItemsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.productId = const Value.absent(),
    this.saleId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SaleLineItemsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String productId,
    required String saleId,
    required double quantity,
    required double totalPrice,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        saleId = Value(saleId),
        quantity = Value(quantity),
        totalPrice = Value(totalPrice);
  static Insertable<SaleLineItem> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? productId,
    Expression<String>? saleId,
    Expression<double>? quantity,
    Expression<double>? totalPrice,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (productId != null) 'product_id': productId,
      if (saleId != null) 'sale_id': saleId,
      if (quantity != null) 'quantity': quantity,
      if (totalPrice != null) 'total_price': totalPrice,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SaleLineItemsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String>? productId,
      Value<String>? saleId,
      Value<double>? quantity,
      Value<double>? totalPrice,
      Value<int>? rowid}) {
    return SaleLineItemsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
      saleId: saleId ?? this.saleId,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleLineItemsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('productId: $productId, ')
          ..write('saleId: $saleId, ')
          ..write('quantity: $quantity, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchasesTable extends Purchases
    with TableInfo<$PurchasesTable, Purchase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, notes, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchases';
  @override
  VerificationContext validateIntegrity(Insertable<Purchase> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Purchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Purchase(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $PurchasesTable createAlias(String alias) {
    return $PurchasesTable(attachedDatabase, alias);
  }
}

class PurchasesCompanion extends UpdateCompanion<Purchase> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> notes;
  final Value<DateTime> date;
  final Value<int> rowid;
  const PurchasesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchasesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime date,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date);
  static Insertable<Purchase> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? notes,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (notes != null) 'notes': notes,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchasesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String?>? notes,
      Value<DateTime>? date,
      Value<int>? rowid}) {
    return PurchasesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('notes: $notes, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseLineItemsTable extends PurchaseLineItems
    with TableInfo<$PurchaseLineItemsTable, PurchaseLineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseLineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _purchaseIdMeta =
      const VerificationMeta('purchaseId');
  @override
  late final GeneratedColumn<String> purchaseId = GeneratedColumn<String>(
      'purchase_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES purchases (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      check: () => ComparableExpr(quantity).isBiggerThanValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _totalCostMeta =
      const VerificationMeta('totalCost');
  @override
  late final GeneratedColumn<double> totalCost = GeneratedColumn<double>(
      'total_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitCostMeta =
      const VerificationMeta('unitCost');
  @override
  late final GeneratedColumn<double> unitCost = GeneratedColumn<double>(
      'unit_cost', aliasedName, false,
      generatedAs: GeneratedAs(totalCost / quantity, false),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        productId,
        purchaseId,
        quantity,
        totalCost,
        unitCost
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_line_items';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseLineItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
          _purchaseIdMeta,
          purchaseId.isAcceptableOrUnknown(
              data['purchase_id']!, _purchaseIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('total_cost')) {
      context.handle(_totalCostMeta,
          totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta));
    } else if (isInserting) {
      context.missing(_totalCostMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(_unitCostMeta,
          unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PurchaseLineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseLineItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      purchaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purchase_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      totalCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_cost'])!,
      unitCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_cost'])!,
    );
  }

  @override
  $PurchaseLineItemsTable createAlias(String alias) {
    return $PurchaseLineItemsTable(attachedDatabase, alias);
  }
}

class PurchaseLineItemsCompanion extends UpdateCompanion<PurchaseLineItem> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> productId;
  final Value<String> purchaseId;
  final Value<double> quantity;
  final Value<double> totalCost;
  final Value<int> rowid;
  const PurchaseLineItemsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.productId = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseLineItemsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String productId,
    required String purchaseId,
    required double quantity,
    required double totalCost,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        purchaseId = Value(purchaseId),
        quantity = Value(quantity),
        totalCost = Value(totalCost);
  static Insertable<PurchaseLineItem> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? productId,
    Expression<String>? purchaseId,
    Expression<double>? quantity,
    Expression<double>? totalCost,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (productId != null) 'product_id': productId,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (quantity != null) 'quantity': quantity,
      if (totalCost != null) 'total_cost': totalCost,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseLineItemsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String>? productId,
      Value<String>? purchaseId,
      Value<double>? quantity,
      Value<double>? totalCost,
      Value<int>? rowid}) {
    return PurchaseLineItemsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
      purchaseId: purchaseId ?? this.purchaseId,
      quantity: quantity ?? this.quantity,
      totalCost: totalCost ?? this.totalCost,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<String>(purchaseId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<double>(totalCost.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseLineItemsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('productId: $productId, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('quantity: $quantity, ')
          ..write('totalCost: $totalCost, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockConversionsTable extends StockConversions
    with TableInfo<$StockConversionsTable, StockConversion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockConversionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _fromProductIdMeta =
      const VerificationMeta('fromProductId');
  @override
  late final GeneratedColumn<String> fromProductId = GeneratedColumn<String>(
      'from_product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _toProductIdMeta =
      const VerificationMeta('toProductId');
  @override
  late final GeneratedColumn<String> toProductId = GeneratedColumn<String>(
      'to_product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      check: () => ComparableExpr(quantity).isBiggerThanValue(0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, fromProductId, toProductId, quantity, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_conversions';
  @override
  VerificationContext validateIntegrity(Insertable<StockConversion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('from_product_id')) {
      context.handle(
          _fromProductIdMeta,
          fromProductId.isAcceptableOrUnknown(
              data['from_product_id']!, _fromProductIdMeta));
    } else if (isInserting) {
      context.missing(_fromProductIdMeta);
    }
    if (data.containsKey('to_product_id')) {
      context.handle(
          _toProductIdMeta,
          toProductId.isAcceptableOrUnknown(
              data['to_product_id']!, _toProductIdMeta));
    } else if (isInserting) {
      context.missing(_toProductIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StockConversion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockConversion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      fromProductId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}from_product_id'])!,
      toProductId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $StockConversionsTable createAlias(String alias) {
    return $StockConversionsTable(attachedDatabase, alias);
  }
}

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

class StockConversionsCompanion extends UpdateCompanion<StockConversion> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> fromProductId;
  final Value<String> toProductId;
  final Value<double> quantity;
  final Value<DateTime> date;
  final Value<int> rowid;
  const StockConversionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.fromProductId = const Value.absent(),
    this.toProductId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockConversionsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String fromProductId,
    required String toProductId,
    required double quantity,
    required DateTime date,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fromProductId = Value(fromProductId),
        toProductId = Value(toProductId),
        quantity = Value(quantity),
        date = Value(date);
  static Insertable<StockConversion> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? fromProductId,
    Expression<String>? toProductId,
    Expression<double>? quantity,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (fromProductId != null) 'from_product_id': fromProductId,
      if (toProductId != null) 'to_product_id': toProductId,
      if (quantity != null) 'quantity': quantity,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockConversionsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String>? fromProductId,
      Value<String>? toProductId,
      Value<double>? quantity,
      Value<DateTime>? date,
      Value<int>? rowid}) {
    return StockConversionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fromProductId: fromProductId ?? this.fromProductId,
      toProductId: toProductId ?? this.toProductId,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (fromProductId.present) {
      map['from_product_id'] = Variable<String>(fromProductId.value);
    }
    if (toProductId.present) {
      map['to_product_id'] = Variable<String>(toProductId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockConversionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('fromProductId: $fromProductId, ')
          ..write('toProductId: $toProductId, ')
          ..write('quantity: $quantity, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockAdjustmentsTable extends StockAdjustments
    with TableInfo<$StockAdjustmentsTable, StockAdjustment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, productId, quantity, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_adjustments';
  @override
  VerificationContext validateIntegrity(Insertable<StockAdjustment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StockAdjustment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockAdjustment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $StockAdjustmentsTable createAlias(String alias) {
    return $StockAdjustmentsTable(attachedDatabase, alias);
  }
}

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

class StockAdjustmentsCompanion extends UpdateCompanion<StockAdjustment> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> productId;
  final Value<double> quantity;
  final Value<DateTime> date;
  final Value<int> rowid;
  const StockAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockAdjustmentsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String productId,
    required double quantity,
    required DateTime date,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        quantity = Value(quantity),
        date = Value(date);
  static Insertable<StockAdjustment> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? productId,
    Expression<double>? quantity,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockAdjustmentsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String>? productId,
      Value<double>? quantity,
      Value<DateTime>? date,
      Value<int>? rowid}) {
    return StockAdjustmentsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockMovementsTable extends StockMovements
    with TableInfo<$StockMovementsTable, StockMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _referenceTypeMeta =
      const VerificationMeta('referenceType');
  @override
  late final GeneratedColumn<String> referenceType = GeneratedColumn<String>(
      'reference_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _referenceIdMeta =
      const VerificationMeta('referenceId');
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
      'reference_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, productId, quantity, referenceType, referenceId, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_movements';
  @override
  VerificationContext validateIntegrity(Insertable<StockMovement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('reference_type')) {
      context.handle(
          _referenceTypeMeta,
          referenceType.isAcceptableOrUnknown(
              data['reference_type']!, _referenceTypeMeta));
    } else if (isInserting) {
      context.missing(_referenceTypeMeta);
    }
    if (data.containsKey('reference_id')) {
      context.handle(
          _referenceIdMeta,
          referenceId.isAcceptableOrUnknown(
              data['reference_id']!, _referenceIdMeta));
    } else if (isInserting) {
      context.missing(_referenceIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockMovement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      referenceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_type'])!,
      referenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $StockMovementsTable createAlias(String alias) {
    return $StockMovementsTable(attachedDatabase, alias);
  }
}

class StockMovement extends DataClass implements Insertable<StockMovement> {
  final int id;
  final DateTime createdAt;
  final String productId;
  final double quantity;
  final String referenceType;
  final String referenceId;
  final DateTime date;
  const StockMovement(
      {required this.id,
      required this.createdAt,
      required this.productId,
      required this.quantity,
      required this.referenceType,
      required this.referenceId,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['product_id'] = Variable<String>(productId);
    map['quantity'] = Variable<double>(quantity);
    map['reference_type'] = Variable<String>(referenceType);
    map['reference_id'] = Variable<String>(referenceId);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  StockMovementsCompanion toCompanion(bool nullToAbsent) {
    return StockMovementsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      productId: Value(productId),
      quantity: Value(quantity),
      referenceType: Value(referenceType),
      referenceId: Value(referenceId),
      date: Value(date),
    );
  }

  factory StockMovement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockMovement(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      productId: serializer.fromJson<String>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      referenceType: serializer.fromJson<String>(json['referenceType']),
      referenceId: serializer.fromJson<String>(json['referenceId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'productId': serializer.toJson<String>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'referenceType': serializer.toJson<String>(referenceType),
      'referenceId': serializer.toJson<String>(referenceId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  StockMovement copyWith(
          {int? id,
          DateTime? createdAt,
          String? productId,
          double? quantity,
          String? referenceType,
          String? referenceId,
          DateTime? date}) =>
      StockMovement(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        referenceType: referenceType ?? this.referenceType,
        referenceId: referenceId ?? this.referenceId,
        date: date ?? this.date,
      );
  StockMovement copyWithCompanion(StockMovementsCompanion data) {
    return StockMovement(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      referenceType: data.referenceType.present
          ? data.referenceType.value
          : this.referenceType,
      referenceId:
          data.referenceId.present ? data.referenceId.value : this.referenceId,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockMovement(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('referenceType: $referenceType, ')
          ..write('referenceId: $referenceId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, productId, quantity, referenceType, referenceId, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockMovement &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.referenceType == this.referenceType &&
          other.referenceId == this.referenceId &&
          other.date == this.date);
}

class StockMovementsCompanion extends UpdateCompanion<StockMovement> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> productId;
  final Value<double> quantity;
  final Value<String> referenceType;
  final Value<String> referenceId;
  final Value<DateTime> date;
  const StockMovementsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.referenceType = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.date = const Value.absent(),
  });
  StockMovementsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String productId,
    required double quantity,
    required String referenceType,
    required String referenceId,
    required DateTime date,
  })  : productId = Value(productId),
        quantity = Value(quantity),
        referenceType = Value(referenceType),
        referenceId = Value(referenceId),
        date = Value(date);
  static Insertable<StockMovement> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? productId,
    Expression<double>? quantity,
    Expression<String>? referenceType,
    Expression<String>? referenceId,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (referenceType != null) 'reference_type': referenceType,
      if (referenceId != null) 'reference_id': referenceId,
      if (date != null) 'date': date,
    });
  }

  StockMovementsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<String>? productId,
      Value<double>? quantity,
      Value<String>? referenceType,
      Value<String>? referenceId,
      Value<DateTime>? date}) {
    return StockMovementsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      referenceType: referenceType ?? this.referenceType,
      referenceId: referenceId ?? this.referenceId,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (referenceType.present) {
      map['reference_type'] = Variable<String>(referenceType.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockMovementsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('referenceType: $referenceType, ')
          ..write('referenceId: $referenceId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $SalesTable sales = $SalesTable(this);
  late final $SaleLineItemsTable saleLineItems = $SaleLineItemsTable(this);
  late final $PurchasesTable purchases = $PurchasesTable(this);
  late final $PurchaseLineItemsTable purchaseLineItems =
      $PurchaseLineItemsTable(this);
  late final $StockConversionsTable stockConversions =
      $StockConversionsTable(this);
  late final $StockAdjustmentsTable stockAdjustments =
      $StockAdjustmentsTable(this);
  late final $StockMovementsTable stockMovements = $StockMovementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        suppliers,
        products,
        sales,
        saleLineItems,
        purchases,
        purchaseLineItems,
        stockConversions,
        stockAdjustments,
        stockMovements
      ];
}

typedef $$SuppliersTableCreateCompanionBuilder = SuppliersCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  required String name,
  Value<int> rowid,
});
typedef $$SuppliersTableUpdateCompanionBuilder = SuppliersCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String> name,
  Value<int> rowid,
});

final class $$SuppliersTableReferences
    extends BaseReferences<_$AppDatabase, $SuppliersTable, Supplier> {
  $$SuppliersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<Product>> _productsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.products,
          aliasName:
              $_aliasNameGenerator(db.suppliers.id, db.products.supplierId));

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.supplierId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> productsRefs(
      Expression<bool> Function($$ProductsTableFilterComposer f) f) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.supplierId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
      Expression<T> Function($$ProductsTableAnnotationComposer a) f) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.supplierId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SuppliersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SuppliersTable,
    Supplier,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (Supplier, $$SuppliersTableReferences),
    Supplier,
    PrefetchHooks Function({bool productsRefs})> {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SuppliersCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            name: name,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required String name,
            Value<int> rowid = const Value.absent(),
          }) =>
              SuppliersCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            name: name,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SuppliersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SuppliersTableReferences._productsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SuppliersTableReferences(db, table, p0)
                                .productsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.supplierId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SuppliersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SuppliersTable,
    Supplier,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (Supplier, $$SuppliersTableReferences),
    Supplier,
    PrefetchHooks Function({bool productsRefs})>;
typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  required String name,
  required double unitPrice,
  required String unit,
  Value<bool> isActive,
  Value<String?> supplierId,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String> name,
  Value<double> unitPrice,
  Value<String> unit,
  Value<bool> isActive,
  Value<String?> supplierId,
  Value<int> rowid,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SuppliersTable _supplierIdTable(_$AppDatabase db) =>
      db.suppliers.createAlias(
          $_aliasNameGenerator(db.products.supplierId, db.suppliers.id));

  $$SuppliersTableProcessedTableManager? get supplierId {
    final $_column = $_itemColumn<String>('supplier_id');
    if ($_column == null) return null;
    final manager = $$SuppliersTableTableManager($_db, $_db.suppliers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$SaleLineItemsTable, List<SaleLineItem>>
      _saleLineItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.saleLineItems,
              aliasName: $_aliasNameGenerator(
                  db.products.id, db.saleLineItems.productId));

  $$SaleLineItemsTableProcessedTableManager get saleLineItemsRefs {
    final manager = $$SaleLineItemsTableTableManager($_db, $_db.saleLineItems)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleLineItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PurchaseLineItemsTable, List<PurchaseLineItem>>
      _purchaseLineItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.purchaseLineItems,
              aliasName: $_aliasNameGenerator(
                  db.products.id, db.purchaseLineItems.productId));

  $$PurchaseLineItemsTableProcessedTableManager get purchaseLineItemsRefs {
    final manager = $$PurchaseLineItemsTableTableManager(
            $_db, $_db.purchaseLineItems)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_purchaseLineItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StockAdjustmentsTable, List<StockAdjustment>>
      _stockAdjustmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.stockAdjustments,
              aliasName: $_aliasNameGenerator(
                  db.products.id, db.stockAdjustments.productId));

  $$StockAdjustmentsTableProcessedTableManager get stockAdjustmentsRefs {
    final manager = $$StockAdjustmentsTableTableManager(
            $_db, $_db.stockAdjustments)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_stockAdjustmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StockMovementsTable, List<StockMovement>>
      _stockMovementsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.stockMovements,
              aliasName: $_aliasNameGenerator(
                  db.products.id, db.stockMovements.productId));

  $$StockMovementsTableProcessedTableManager get stockMovementsRefs {
    final manager = $$StockMovementsTableTableManager($_db, $_db.stockMovements)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_stockMovementsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isWeightBased => $composableBuilder(
      column: $table.isWeightBased, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  $$SuppliersTableFilterComposer get supplierId {
    final $$SuppliersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierId,
        referencedTable: $db.suppliers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SuppliersTableFilterComposer(
              $db: $db,
              $table: $db.suppliers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> saleLineItemsRefs(
      Expression<bool> Function($$SaleLineItemsTableFilterComposer f) f) {
    final $$SaleLineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.saleLineItems,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SaleLineItemsTableFilterComposer(
              $db: $db,
              $table: $db.saleLineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> purchaseLineItemsRefs(
      Expression<bool> Function($$PurchaseLineItemsTableFilterComposer f) f) {
    final $$PurchaseLineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.purchaseLineItems,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchaseLineItemsTableFilterComposer(
              $db: $db,
              $table: $db.purchaseLineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> stockAdjustmentsRefs(
      Expression<bool> Function($$StockAdjustmentsTableFilterComposer f) f) {
    final $$StockAdjustmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockAdjustments,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockAdjustmentsTableFilterComposer(
              $db: $db,
              $table: $db.stockAdjustments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> stockMovementsRefs(
      Expression<bool> Function($$StockMovementsTableFilterComposer f) f) {
    final $$StockMovementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockMovements,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockMovementsTableFilterComposer(
              $db: $db,
              $table: $db.stockMovements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isWeightBased => $composableBuilder(
      column: $table.isWeightBased,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  $$SuppliersTableOrderingComposer get supplierId {
    final $$SuppliersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierId,
        referencedTable: $db.suppliers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SuppliersTableOrderingComposer(
              $db: $db,
              $table: $db.suppliers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<bool> get isWeightBased => $composableBuilder(
      column: $table.isWeightBased, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$SuppliersTableAnnotationComposer get supplierId {
    final $$SuppliersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierId,
        referencedTable: $db.suppliers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SuppliersTableAnnotationComposer(
              $db: $db,
              $table: $db.suppliers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> saleLineItemsRefs<T extends Object>(
      Expression<T> Function($$SaleLineItemsTableAnnotationComposer a) f) {
    final $$SaleLineItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.saleLineItems,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SaleLineItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.saleLineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> purchaseLineItemsRefs<T extends Object>(
      Expression<T> Function($$PurchaseLineItemsTableAnnotationComposer a) f) {
    final $$PurchaseLineItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.purchaseLineItems,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseLineItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.purchaseLineItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> stockAdjustmentsRefs<T extends Object>(
      Expression<T> Function($$StockAdjustmentsTableAnnotationComposer a) f) {
    final $$StockAdjustmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockAdjustments,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockAdjustmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.stockAdjustments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> stockMovementsRefs<T extends Object>(
      Expression<T> Function($$StockMovementsTableAnnotationComposer a) f) {
    final $$StockMovementsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockMovements,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockMovementsTableAnnotationComposer(
              $db: $db,
              $table: $db.stockMovements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function(
        {bool supplierId,
        bool saleLineItemsRefs,
        bool purchaseLineItemsRefs,
        bool stockAdjustmentsRefs,
        bool stockMovementsRefs})> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> unitPrice = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> supplierId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            name: name,
            unitPrice: unitPrice,
            unit: unit,
            isActive: isActive,
            supplierId: supplierId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required String name,
            required double unitPrice,
            required String unit,
            Value<bool> isActive = const Value.absent(),
            Value<String?> supplierId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            name: name,
            unitPrice: unitPrice,
            unit: unit,
            isActive: isActive,
            supplierId: supplierId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProductsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {supplierId = false,
              saleLineItemsRefs = false,
              purchaseLineItemsRefs = false,
              stockAdjustmentsRefs = false,
              stockMovementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (saleLineItemsRefs) db.saleLineItems,
                if (purchaseLineItemsRefs) db.purchaseLineItems,
                if (stockAdjustmentsRefs) db.stockAdjustments,
                if (stockMovementsRefs) db.stockMovements
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (supplierId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.supplierId,
                    referencedTable:
                        $$ProductsTableReferences._supplierIdTable(db),
                    referencedColumn:
                        $$ProductsTableReferences._supplierIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (saleLineItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._saleLineItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .saleLineItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items),
                  if (purchaseLineItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._purchaseLineItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .purchaseLineItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items),
                  if (stockAdjustmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._stockAdjustmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .stockAdjustmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items),
                  if (stockMovementsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._stockMovementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .stockMovementsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function(
        {bool supplierId,
        bool saleLineItemsRefs,
        bool purchaseLineItemsRefs,
        bool stockAdjustmentsRefs,
        bool stockMovementsRefs})>;
typedef $$SalesTableCreateCompanionBuilder = SalesCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> notes,
  required DateTime date,
  Value<int> rowid,
});
typedef $$SalesTableUpdateCompanionBuilder = SalesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> notes,
  Value<DateTime> date,
  Value<int> rowid,
});

final class $$SalesTableReferences
    extends BaseReferences<_$AppDatabase, $SalesTable, Sale> {
  $$SalesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SaleLineItemsTable, List<SaleLineItem>>
      _saleLineItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.saleLineItems,
              aliasName:
                  $_aliasNameGenerator(db.sales.id, db.saleLineItems.saleId));

  $$SaleLineItemsTableProcessedTableManager get saleLineItemsRefs {
    final manager = $$SaleLineItemsTableTableManager($_db, $_db.saleLineItems)
        .filter((f) => f.saleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleLineItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SalesTableFilterComposer extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  Expression<bool> saleLineItemsRefs(
      Expression<bool> Function($$SaleLineItemsTableFilterComposer f) f) {
    final $$SaleLineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.saleLineItems,
        getReferencedColumn: (t) => t.saleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SaleLineItemsTableFilterComposer(
              $db: $db,
              $table: $db.saleLineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SalesTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$SalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesTable> {
  $$SalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  Expression<T> saleLineItemsRefs<T extends Object>(
      Expression<T> Function($$SaleLineItemsTableAnnotationComposer a) f) {
    final $$SaleLineItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.saleLineItems,
        getReferencedColumn: (t) => t.saleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SaleLineItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.saleLineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SalesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SalesTable,
    Sale,
    $$SalesTableFilterComposer,
    $$SalesTableOrderingComposer,
    $$SalesTableAnnotationComposer,
    $$SalesTableCreateCompanionBuilder,
    $$SalesTableUpdateCompanionBuilder,
    (Sale, $$SalesTableReferences),
    Sale,
    PrefetchHooks Function({bool saleLineItemsRefs})> {
  $$SalesTableTableManager(_$AppDatabase db, $SalesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SalesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            notes: notes,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              SalesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            notes: notes,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SalesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({saleLineItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (saleLineItemsRefs) db.saleLineItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (saleLineItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SalesTableReferences._saleLineItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SalesTableReferences(db, table, p0)
                                .saleLineItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.saleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SalesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SalesTable,
    Sale,
    $$SalesTableFilterComposer,
    $$SalesTableOrderingComposer,
    $$SalesTableAnnotationComposer,
    $$SalesTableCreateCompanionBuilder,
    $$SalesTableUpdateCompanionBuilder,
    (Sale, $$SalesTableReferences),
    Sale,
    PrefetchHooks Function({bool saleLineItemsRefs})>;
typedef $$SaleLineItemsTableCreateCompanionBuilder = SaleLineItemsCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  required String productId,
  required String saleId,
  required double quantity,
  required double totalPrice,
  Value<int> rowid,
});
typedef $$SaleLineItemsTableUpdateCompanionBuilder = SaleLineItemsCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String> productId,
  Value<String> saleId,
  Value<double> quantity,
  Value<double> totalPrice,
  Value<int> rowid,
});

final class $$SaleLineItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SaleLineItemsTable, SaleLineItem> {
  $$SaleLineItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
          $_aliasNameGenerator(db.saleLineItems.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SalesTable _saleIdTable(_$AppDatabase db) => db.sales
      .createAlias($_aliasNameGenerator(db.saleLineItems.saleId, db.sales.id));

  $$SalesTableProcessedTableManager get saleId {
    final $_column = $_itemColumn<String>('sale_id')!;

    final manager = $$SalesTableTableManager($_db, $_db.sales)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_saleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SaleLineItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleLineItemsTable> {
  $$SaleLineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SalesTableFilterComposer get saleId {
    final $$SalesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.saleId,
        referencedTable: $db.sales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableFilterComposer(
              $db: $db,
              $table: $db.sales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SaleLineItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleLineItemsTable> {
  $$SaleLineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SalesTableOrderingComposer get saleId {
    final $$SalesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.saleId,
        referencedTable: $db.sales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableOrderingComposer(
              $db: $db,
              $table: $db.sales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SaleLineItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleLineItemsTable> {
  $$SaleLineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SalesTableAnnotationComposer get saleId {
    final $$SalesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.saleId,
        referencedTable: $db.sales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableAnnotationComposer(
              $db: $db,
              $table: $db.sales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SaleLineItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SaleLineItemsTable,
    SaleLineItem,
    $$SaleLineItemsTableFilterComposer,
    $$SaleLineItemsTableOrderingComposer,
    $$SaleLineItemsTableAnnotationComposer,
    $$SaleLineItemsTableCreateCompanionBuilder,
    $$SaleLineItemsTableUpdateCompanionBuilder,
    (SaleLineItem, $$SaleLineItemsTableReferences),
    SaleLineItem,
    PrefetchHooks Function({bool productId, bool saleId})> {
  $$SaleLineItemsTableTableManager(_$AppDatabase db, $SaleLineItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleLineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleLineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleLineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> saleId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SaleLineItemsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            productId: productId,
            saleId: saleId,
            quantity: quantity,
            totalPrice: totalPrice,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required String productId,
            required String saleId,
            required double quantity,
            required double totalPrice,
            Value<int> rowid = const Value.absent(),
          }) =>
              SaleLineItemsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            productId: productId,
            saleId: saleId,
            quantity: quantity,
            totalPrice: totalPrice,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SaleLineItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false, saleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$SaleLineItemsTableReferences._productIdTable(db),
                    referencedColumn:
                        $$SaleLineItemsTableReferences._productIdTable(db).id,
                  ) as T;
                }
                if (saleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.saleId,
                    referencedTable:
                        $$SaleLineItemsTableReferences._saleIdTable(db),
                    referencedColumn:
                        $$SaleLineItemsTableReferences._saleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SaleLineItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SaleLineItemsTable,
    SaleLineItem,
    $$SaleLineItemsTableFilterComposer,
    $$SaleLineItemsTableOrderingComposer,
    $$SaleLineItemsTableAnnotationComposer,
    $$SaleLineItemsTableCreateCompanionBuilder,
    $$SaleLineItemsTableUpdateCompanionBuilder,
    (SaleLineItem, $$SaleLineItemsTableReferences),
    SaleLineItem,
    PrefetchHooks Function({bool productId, bool saleId})>;
typedef $$PurchasesTableCreateCompanionBuilder = PurchasesCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> notes,
  required DateTime date,
  Value<int> rowid,
});
typedef $$PurchasesTableUpdateCompanionBuilder = PurchasesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> notes,
  Value<DateTime> date,
  Value<int> rowid,
});

final class $$PurchasesTableReferences
    extends BaseReferences<_$AppDatabase, $PurchasesTable, Purchase> {
  $$PurchasesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PurchaseLineItemsTable, List<PurchaseLineItem>>
      _purchaseLineItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.purchaseLineItems,
              aliasName: $_aliasNameGenerator(
                  db.purchases.id, db.purchaseLineItems.purchaseId));

  $$PurchaseLineItemsTableProcessedTableManager get purchaseLineItemsRefs {
    final manager = $$PurchaseLineItemsTableTableManager(
            $_db, $_db.purchaseLineItems)
        .filter((f) => f.purchaseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_purchaseLineItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PurchasesTableFilterComposer
    extends Composer<_$AppDatabase, $PurchasesTable> {
  $$PurchasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  Expression<bool> purchaseLineItemsRefs(
      Expression<bool> Function($$PurchaseLineItemsTableFilterComposer f) f) {
    final $$PurchaseLineItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.purchaseLineItems,
        getReferencedColumn: (t) => t.purchaseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchaseLineItemsTableFilterComposer(
              $db: $db,
              $table: $db.purchaseLineItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PurchasesTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchasesTable> {
  $$PurchasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$PurchasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchasesTable> {
  $$PurchasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  Expression<T> purchaseLineItemsRefs<T extends Object>(
      Expression<T> Function($$PurchaseLineItemsTableAnnotationComposer a) f) {
    final $$PurchaseLineItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.purchaseLineItems,
            getReferencedColumn: (t) => t.purchaseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseLineItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.purchaseLineItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PurchasesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchasesTable,
    Purchase,
    $$PurchasesTableFilterComposer,
    $$PurchasesTableOrderingComposer,
    $$PurchasesTableAnnotationComposer,
    $$PurchasesTableCreateCompanionBuilder,
    $$PurchasesTableUpdateCompanionBuilder,
    (Purchase, $$PurchasesTableReferences),
    Purchase,
    PrefetchHooks Function({bool purchaseLineItemsRefs})> {
  $$PurchasesTableTableManager(_$AppDatabase db, $PurchasesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PurchasesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            notes: notes,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              PurchasesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            notes: notes,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PurchasesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({purchaseLineItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (purchaseLineItemsRefs) db.purchaseLineItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (purchaseLineItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PurchasesTableReferences
                            ._purchaseLineItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PurchasesTableReferences(db, table, p0)
                                .purchaseLineItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.purchaseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PurchasesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchasesTable,
    Purchase,
    $$PurchasesTableFilterComposer,
    $$PurchasesTableOrderingComposer,
    $$PurchasesTableAnnotationComposer,
    $$PurchasesTableCreateCompanionBuilder,
    $$PurchasesTableUpdateCompanionBuilder,
    (Purchase, $$PurchasesTableReferences),
    Purchase,
    PrefetchHooks Function({bool purchaseLineItemsRefs})>;
typedef $$PurchaseLineItemsTableCreateCompanionBuilder
    = PurchaseLineItemsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  required String productId,
  required String purchaseId,
  required double quantity,
  required double totalCost,
  Value<int> rowid,
});
typedef $$PurchaseLineItemsTableUpdateCompanionBuilder
    = PurchaseLineItemsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String> productId,
  Value<String> purchaseId,
  Value<double> quantity,
  Value<double> totalCost,
  Value<int> rowid,
});

final class $$PurchaseLineItemsTableReferences extends BaseReferences<
    _$AppDatabase, $PurchaseLineItemsTable, PurchaseLineItem> {
  $$PurchaseLineItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
          $_aliasNameGenerator(db.purchaseLineItems.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PurchasesTable _purchaseIdTable(_$AppDatabase db) =>
      db.purchases.createAlias($_aliasNameGenerator(
          db.purchaseLineItems.purchaseId, db.purchases.id));

  $$PurchasesTableProcessedTableManager get purchaseId {
    final $_column = $_itemColumn<String>('purchase_id')!;

    final manager = $$PurchasesTableTableManager($_db, $_db.purchases)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_purchaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PurchaseLineItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseLineItemsTable> {
  $$PurchaseLineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PurchasesTableFilterComposer get purchaseId {
    final $$PurchasesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.purchaseId,
        referencedTable: $db.purchases,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchasesTableFilterComposer(
              $db: $db,
              $table: $db.purchases,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseLineItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseLineItemsTable> {
  $$PurchaseLineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PurchasesTableOrderingComposer get purchaseId {
    final $$PurchasesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.purchaseId,
        referencedTable: $db.purchases,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchasesTableOrderingComposer(
              $db: $db,
              $table: $db.purchases,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseLineItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseLineItemsTable> {
  $$PurchaseLineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get totalCost =>
      $composableBuilder(column: $table.totalCost, builder: (column) => column);

  GeneratedColumn<double> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PurchasesTableAnnotationComposer get purchaseId {
    final $$PurchasesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.purchaseId,
        referencedTable: $db.purchases,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchasesTableAnnotationComposer(
              $db: $db,
              $table: $db.purchases,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseLineItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseLineItemsTable,
    PurchaseLineItem,
    $$PurchaseLineItemsTableFilterComposer,
    $$PurchaseLineItemsTableOrderingComposer,
    $$PurchaseLineItemsTableAnnotationComposer,
    $$PurchaseLineItemsTableCreateCompanionBuilder,
    $$PurchaseLineItemsTableUpdateCompanionBuilder,
    (PurchaseLineItem, $$PurchaseLineItemsTableReferences),
    PurchaseLineItem,
    PrefetchHooks Function({bool productId, bool purchaseId})> {
  $$PurchaseLineItemsTableTableManager(
      _$AppDatabase db, $PurchaseLineItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseLineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseLineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseLineItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> purchaseId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> totalCost = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PurchaseLineItemsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            productId: productId,
            purchaseId: purchaseId,
            quantity: quantity,
            totalCost: totalCost,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required String productId,
            required String purchaseId,
            required double quantity,
            required double totalCost,
            Value<int> rowid = const Value.absent(),
          }) =>
              PurchaseLineItemsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            productId: productId,
            purchaseId: purchaseId,
            quantity: quantity,
            totalCost: totalCost,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PurchaseLineItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false, purchaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$PurchaseLineItemsTableReferences._productIdTable(db),
                    referencedColumn: $$PurchaseLineItemsTableReferences
                        ._productIdTable(db)
                        .id,
                  ) as T;
                }
                if (purchaseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.purchaseId,
                    referencedTable:
                        $$PurchaseLineItemsTableReferences._purchaseIdTable(db),
                    referencedColumn: $$PurchaseLineItemsTableReferences
                        ._purchaseIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PurchaseLineItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchaseLineItemsTable,
    PurchaseLineItem,
    $$PurchaseLineItemsTableFilterComposer,
    $$PurchaseLineItemsTableOrderingComposer,
    $$PurchaseLineItemsTableAnnotationComposer,
    $$PurchaseLineItemsTableCreateCompanionBuilder,
    $$PurchaseLineItemsTableUpdateCompanionBuilder,
    (PurchaseLineItem, $$PurchaseLineItemsTableReferences),
    PurchaseLineItem,
    PrefetchHooks Function({bool productId, bool purchaseId})>;
typedef $$StockConversionsTableCreateCompanionBuilder
    = StockConversionsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  required String fromProductId,
  required String toProductId,
  required double quantity,
  required DateTime date,
  Value<int> rowid,
});
typedef $$StockConversionsTableUpdateCompanionBuilder
    = StockConversionsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String> fromProductId,
  Value<String> toProductId,
  Value<double> quantity,
  Value<DateTime> date,
  Value<int> rowid,
});

final class $$StockConversionsTableReferences extends BaseReferences<
    _$AppDatabase, $StockConversionsTable, StockConversion> {
  $$StockConversionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _fromProductIdTable(_$AppDatabase db) =>
      db.products.createAlias($_aliasNameGenerator(
          db.stockConversions.fromProductId, db.products.id));

  $$ProductsTableProcessedTableManager get fromProductId {
    final $_column = $_itemColumn<String>('from_product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromProductIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProductsTable _toProductIdTable(_$AppDatabase db) =>
      db.products.createAlias($_aliasNameGenerator(
          db.stockConversions.toProductId, db.products.id));

  $$ProductsTableProcessedTableManager get toProductId {
    final $_column = $_itemColumn<String>('to_product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toProductIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StockConversionsTableFilterComposer
    extends Composer<_$AppDatabase, $StockConversionsTable> {
  $$StockConversionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get fromProductId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromProductId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableFilterComposer get toProductId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toProductId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockConversionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StockConversionsTable> {
  $$StockConversionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get fromProductId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromProductId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableOrderingComposer get toProductId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toProductId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockConversionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockConversionsTable> {
  $$StockConversionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$ProductsTableAnnotationComposer get fromProductId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromProductId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableAnnotationComposer get toProductId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toProductId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockConversionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockConversionsTable,
    StockConversion,
    $$StockConversionsTableFilterComposer,
    $$StockConversionsTableOrderingComposer,
    $$StockConversionsTableAnnotationComposer,
    $$StockConversionsTableCreateCompanionBuilder,
    $$StockConversionsTableUpdateCompanionBuilder,
    (StockConversion, $$StockConversionsTableReferences),
    StockConversion,
    PrefetchHooks Function({bool fromProductId, bool toProductId})> {
  $$StockConversionsTableTableManager(
      _$AppDatabase db, $StockConversionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockConversionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockConversionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockConversionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String> fromProductId = const Value.absent(),
            Value<String> toProductId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockConversionsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            fromProductId: fromProductId,
            toProductId: toProductId,
            quantity: quantity,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required String fromProductId,
            required String toProductId,
            required double quantity,
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              StockConversionsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            fromProductId: fromProductId,
            toProductId: toProductId,
            quantity: quantity,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StockConversionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {fromProductId = false, toProductId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fromProductId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromProductId,
                    referencedTable: $$StockConversionsTableReferences
                        ._fromProductIdTable(db),
                    referencedColumn: $$StockConversionsTableReferences
                        ._fromProductIdTable(db)
                        .id,
                  ) as T;
                }
                if (toProductId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toProductId,
                    referencedTable:
                        $$StockConversionsTableReferences._toProductIdTable(db),
                    referencedColumn: $$StockConversionsTableReferences
                        ._toProductIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StockConversionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockConversionsTable,
    StockConversion,
    $$StockConversionsTableFilterComposer,
    $$StockConversionsTableOrderingComposer,
    $$StockConversionsTableAnnotationComposer,
    $$StockConversionsTableCreateCompanionBuilder,
    $$StockConversionsTableUpdateCompanionBuilder,
    (StockConversion, $$StockConversionsTableReferences),
    StockConversion,
    PrefetchHooks Function({bool fromProductId, bool toProductId})>;
typedef $$StockAdjustmentsTableCreateCompanionBuilder
    = StockAdjustmentsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  required String productId,
  required double quantity,
  required DateTime date,
  Value<int> rowid,
});
typedef $$StockAdjustmentsTableUpdateCompanionBuilder
    = StockAdjustmentsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String> productId,
  Value<double> quantity,
  Value<DateTime> date,
  Value<int> rowid,
});

final class $$StockAdjustmentsTableReferences extends BaseReferences<
    _$AppDatabase, $StockAdjustmentsTable, StockAdjustment> {
  $$StockAdjustmentsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
          $_aliasNameGenerator(db.stockAdjustments.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StockAdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $StockAdjustmentsTable> {
  $$StockAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockAdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StockAdjustmentsTable> {
  $$StockAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockAdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockAdjustmentsTable> {
  $$StockAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockAdjustmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockAdjustmentsTable,
    StockAdjustment,
    $$StockAdjustmentsTableFilterComposer,
    $$StockAdjustmentsTableOrderingComposer,
    $$StockAdjustmentsTableAnnotationComposer,
    $$StockAdjustmentsTableCreateCompanionBuilder,
    $$StockAdjustmentsTableUpdateCompanionBuilder,
    (StockAdjustment, $$StockAdjustmentsTableReferences),
    StockAdjustment,
    PrefetchHooks Function({bool productId})> {
  $$StockAdjustmentsTableTableManager(
      _$AppDatabase db, $StockAdjustmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockAdjustmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockAdjustmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockAdjustmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockAdjustmentsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            productId: productId,
            quantity: quantity,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required String productId,
            required double quantity,
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              StockAdjustmentsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            productId: productId,
            quantity: quantity,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StockAdjustmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$StockAdjustmentsTableReferences._productIdTable(db),
                    referencedColumn: $$StockAdjustmentsTableReferences
                        ._productIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StockAdjustmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockAdjustmentsTable,
    StockAdjustment,
    $$StockAdjustmentsTableFilterComposer,
    $$StockAdjustmentsTableOrderingComposer,
    $$StockAdjustmentsTableAnnotationComposer,
    $$StockAdjustmentsTableCreateCompanionBuilder,
    $$StockAdjustmentsTableUpdateCompanionBuilder,
    (StockAdjustment, $$StockAdjustmentsTableReferences),
    StockAdjustment,
    PrefetchHooks Function({bool productId})>;
typedef $$StockMovementsTableCreateCompanionBuilder = StockMovementsCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  required String productId,
  required double quantity,
  required String referenceType,
  required String referenceId,
  required DateTime date,
});
typedef $$StockMovementsTableUpdateCompanionBuilder = StockMovementsCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<String> productId,
  Value<double> quantity,
  Value<String> referenceType,
  Value<String> referenceId,
  Value<DateTime> date,
});

final class $$StockMovementsTableReferences
    extends BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovement> {
  $$StockMovementsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
          $_aliasNameGenerator(db.stockMovements.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StockMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceType => $composableBuilder(
      column: $table.referenceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceType => $composableBuilder(
      column: $table.referenceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get referenceType => $composableBuilder(
      column: $table.referenceType, builder: (column) => column);

  GeneratedColumn<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockMovementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockMovementsTable,
    StockMovement,
    $$StockMovementsTableFilterComposer,
    $$StockMovementsTableOrderingComposer,
    $$StockMovementsTableAnnotationComposer,
    $$StockMovementsTableCreateCompanionBuilder,
    $$StockMovementsTableUpdateCompanionBuilder,
    (StockMovement, $$StockMovementsTableReferences),
    StockMovement,
    PrefetchHooks Function({bool productId})> {
  $$StockMovementsTableTableManager(
      _$AppDatabase db, $StockMovementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockMovementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> referenceType = const Value.absent(),
            Value<String> referenceId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              StockMovementsCompanion(
            id: id,
            createdAt: createdAt,
            productId: productId,
            quantity: quantity,
            referenceType: referenceType,
            referenceId: referenceId,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            required String productId,
            required double quantity,
            required String referenceType,
            required String referenceId,
            required DateTime date,
          }) =>
              StockMovementsCompanion.insert(
            id: id,
            createdAt: createdAt,
            productId: productId,
            quantity: quantity,
            referenceType: referenceType,
            referenceId: referenceId,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StockMovementsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$StockMovementsTableReferences._productIdTable(db),
                    referencedColumn:
                        $$StockMovementsTableReferences._productIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StockMovementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockMovementsTable,
    StockMovement,
    $$StockMovementsTableFilterComposer,
    $$StockMovementsTableOrderingComposer,
    $$StockMovementsTableAnnotationComposer,
    $$StockMovementsTableCreateCompanionBuilder,
    $$StockMovementsTableUpdateCompanionBuilder,
    (StockMovement, $$StockMovementsTableReferences),
    StockMovement,
    PrefetchHooks Function({bool productId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db, _db.sales);
  $$SaleLineItemsTableTableManager get saleLineItems =>
      $$SaleLineItemsTableTableManager(_db, _db.saleLineItems);
  $$PurchasesTableTableManager get purchases =>
      $$PurchasesTableTableManager(_db, _db.purchases);
  $$PurchaseLineItemsTableTableManager get purchaseLineItems =>
      $$PurchaseLineItemsTableTableManager(_db, _db.purchaseLineItems);
  $$StockConversionsTableTableManager get stockConversions =>
      $$StockConversionsTableTableManager(_db, _db.stockConversions);
  $$StockAdjustmentsTableTableManager get stockAdjustments =>
      $$StockAdjustmentsTableTableManager(_db, _db.stockAdjustments);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(_db, _db.stockMovements);
}
