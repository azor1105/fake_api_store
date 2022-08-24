import 'package:json_annotation/json_annotation.dart';

import '../address_item/address_item.dart';
import '../name_item/name_item.dart';

part 'user_item.g.dart';

@JsonSerializable()
class UserItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'email')
  String email;

  @JsonKey(defaultValue: '', name: 'username')
  String userName;

  @JsonKey(defaultValue: '', name: 'password')
  String password;

  @JsonKey(name: 'name')
  NameItem name;

  @JsonKey(name: 'address')
  AddressItem addres;

  @JsonKey(defaultValue: '', name: 'phone')
  String phone;

  UserItem({
    required this.id,
    required this.email,
    required this.userName,
    required this.password,
    required this.name,
    required this.addres,
    required this.phone,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserItemToJson(this);
}
