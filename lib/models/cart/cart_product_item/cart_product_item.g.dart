// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItemOfCart _$ProductItemOfCartFromJson(Map<String, dynamic> json) =>
    ProductItemOfCart(
      productId: json['productId'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductItemOfCartToJson(ProductItemOfCart instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
