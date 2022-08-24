// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserItem _$UserItemFromJson(Map<String, dynamic> json) => UserItem(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      userName: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: NameItem.fromJson(json['name'] as Map<String, dynamic>),
      addres: AddressItem.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String? ?? '',
    );

Map<String, dynamic> _$UserItemToJson(UserItem instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.userName,
      'password': instance.password,
      'name': instance.name,
      'address': instance.addres,
      'phone': instance.phone,
    };
