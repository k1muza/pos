import 'package:drift/drift.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/models/product.dart';

class SaleLineItem extends DataClass
    implements Insertable<SaleLineItem> {
  final String id;
  final DateTime createdAt;
  final String productId;
  final String saleId;
  final double quantity;
  final double totalPrice;
  final double unitPrice;
  final Product? product;
  const SaleLineItem({
    required this.id,
    required this.createdAt,
    required this.productId,
    required this.saleId,
    required this.quantity,
    required this.totalPrice,
    required this.unitPrice,
    this.product,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['product_id'] = Variable<String>(productId);
    map['sale_id'] = Variable<String>(saleId);
    map['quantity'] = Variable<double>(quantity);
    map['total_price'] = Variable<double>(totalPrice);
    return map;
  }

  SaleLineItemsCompanion toCompanion(bool nullToAbsent) {
    return SaleLineItemsCompanion(
      id: Value(id),
      createdAt: createdAt == null && nullToAbsent ? const Value.absent() : Value(createdAt),
      productId: Value(productId),
      saleId: Value(saleId),
      quantity: Value(quantity),
      totalPrice: totalPrice == null && nullToAbsent ? const Value.absent() : Value(totalPrice),
    );
  }


  factory SaleLineItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    double unitPrice = json.containsKey('unitPrice') ? serializer.fromJson<double>(double.parse(json['unitPrice'])) : 0.0;
    double quantity = json.containsKey('quantity') ? serializer.fromJson<double>(double.parse(json['quantity'])) : 0.0;
    double totalPrice = json.containsKey('totalPrice') ? serializer.fromJson<double>(double.parse(json['totalPrice'])) : unitPrice * quantity;
    Product ? product = json.containsKey('product') ? Product.fromJson(json['product'] as Map<String, dynamic>) : null;

    return SaleLineItem(
      id: serializer.fromJson<String>(json['id']),
      createdAt: json.containsKey('createdAt') ? serializer.fromJson<DateTime>(json['createdAt']) : DateTime.now(),
      productId: product == null ? '' : product.id,
      saleId: serializer.fromJson<String>(json['saleId']),
      quantity: quantity,
      totalPrice: totalPrice,
      unitPrice: unitPrice,
    );
  }

  @override
  /// Converts this [SaleLineItem] object to a json-like [Map].
  ///
  /// This is the inverse of [SaleLineItem.fromJson].
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'productId': serializer.toJson<String>(productId),
      'saleId': serializer.toJson<String>(saleId),
      'quantity': serializer.toJson<double>(quantity),
      'totalPrice': serializer.toJson<double?>(totalPrice),
      'unitPrice': serializer.toJson<double>(unitPrice),
    };
  }

  SaleLineItem copyWith(
          {String? id,
          DateTime? createdAt,
          String? productId,
          String? saleId,
          double? quantity,
          double? totalPrice,
          double? unitPrice}) =>
      SaleLineItem(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        productId: productId ?? this.productId,
        saleId: saleId ?? this.saleId,
        quantity: quantity ?? this.quantity,
        totalPrice: totalPrice ?? this.totalPrice,
        unitPrice: unitPrice ?? this.unitPrice,
      );
  @override
  String toString() {
    return (StringBuffer('SaleLineItem(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('productId: $productId, ')
          ..write('saleId: $saleId, ')
          ..write('quantity: $quantity, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('unitPrice: $unitPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, productId,
      saleId, quantity, totalPrice, unitPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleLineItem &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.productId == this.productId &&
          other.saleId == this.saleId &&
          other.quantity == this.quantity &&
          other.totalPrice == this.totalPrice &&
          other.unitPrice == this.unitPrice);
}
