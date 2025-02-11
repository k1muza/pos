import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class PurchaseLineItem extends DataClass
    implements Insertable<PurchaseLineItem> {
  final String id;
  final DateTime createdAt;
  final String productId;
  final String purchaseId;
  final double quantity;
  final double totalCost;
  final double unitCost;
  final Product? product;
  const PurchaseLineItem({
    required this.id,
    required this.createdAt,
    required this.productId,
    required this.purchaseId,
    required this.quantity,
    required this.totalCost,
    required this.unitCost,
    this.product,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['product_id'] = Variable<String>(productId);
    map['purchase_id'] = Variable<String>(purchaseId);
    map['quantity'] = Variable<double>(quantity);
    map['total_cost'] = Variable<double>(totalCost);
    return map;
  }

  PurchaseLineItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseLineItemsCompanion(
      id: Value(id),
      createdAt: createdAt == null && nullToAbsent ? const Value.absent() : Value(createdAt),
      productId: Value(productId),
      purchaseId: Value(purchaseId),
      quantity: Value(quantity),
      totalCost: totalCost == null && nullToAbsent ? const Value.absent() : Value(totalCost),
    );
  }


  factory PurchaseLineItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    double unitCost = json.containsKey('unitCost') ? serializer.fromJson<double>(double.parse(json['unitCost'])) : 0.0;
    double quantity = json.containsKey('quantity') ? serializer.fromJson<double>(double.parse(json['quantity'])) : 0.0;
    double totalCost = json.containsKey('totalCost') ? serializer.fromJson<double>(double.parse(json['totalCost'])) : unitCost * quantity;
    Product ? product = json.containsKey('product') ? Product.fromJson(json['product'] as Map<String, dynamic>) : null;

    return PurchaseLineItem(
      id: serializer.fromJson<String>(json['id']),
      createdAt: json.containsKey('createdAt') ? serializer.fromJson<DateTime>(json['createdAt']) : DateTime.now(),
      productId: product == null ? '' : product.id,
      purchaseId: serializer.fromJson<String>(json['purchaseId']),
      quantity: quantity,
      totalCost: totalCost,
      unitCost: unitCost,
    );
  }

  @override
  /// Converts this [PurchaseLineItem] object to a json-like [Map].
  ///
  /// This is the inverse of [PurchaseLineItem.fromJson].
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'productId': serializer.toJson<String>(productId),
      'purchaseId': serializer.toJson<String>(purchaseId),
      'quantity': serializer.toJson<double>(quantity),
      'totalCost': serializer.toJson<double?>(totalCost),
      'unitCost': serializer.toJson<double>(unitCost),
    };
  }

  PurchaseLineItem copyWith(
          {String? id,
          DateTime? createdAt,
          String? productId,
          String? purchaseId,
          double? quantity,
          double? totalCost,
          double? unitCost}) =>
      PurchaseLineItem(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        productId: productId ?? this.productId,
        purchaseId: purchaseId ?? this.purchaseId,
        quantity: quantity ?? this.quantity,
        totalCost: totalCost ?? this.totalCost,
        unitCost: unitCost ?? this.unitCost,
      );
  @override
  String toString() {
    return (StringBuffer('PurchaseLineItem(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('productId: $productId, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('quantity: $quantity, ')
          ..write('totalCost: $totalCost, ')
          ..write('unitCost: $unitCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, productId,
      purchaseId, quantity, totalCost, unitCost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseLineItem &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.productId == this.productId &&
          other.purchaseId == this.purchaseId &&
          other.quantity == this.quantity &&
          other.totalCost == this.totalCost &&
          other.unitCost == this.unitCost);
}
