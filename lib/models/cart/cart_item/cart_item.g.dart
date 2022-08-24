// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      dateTime: json['date'] as String? ?? '',
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductItemOfCart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.dateTime,
      'products': instance.products,
    };
