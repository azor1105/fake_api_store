// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressItem _$AddressItemFromJson(Map<String, dynamic> json) => AddressItem(
      city: json['city'] as String? ?? '',
      street: json['street'] as String? ?? '',
      number: json['number'] as int? ?? 0,
      zipCode: json['zipcode'] as String? ?? '',
      geolocation:
          GeolocationItem.fromJson(json['geolocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressItemToJson(AddressItem instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipCode,
      'geolocation': instance.geolocation.toJson(),
    };
