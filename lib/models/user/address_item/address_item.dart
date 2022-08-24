import 'package:json_annotation/json_annotation.dart';

import 'geolocaton_item.dart';

part 'address_item.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressItem {
  @JsonKey(defaultValue: '', name: 'city')
  String city;

  @JsonKey(defaultValue: '', name: 'street')
  String street;

  @JsonKey(defaultValue: 0, name: 'number')
  int number;

  @JsonKey(defaultValue: '', name: 'zipcode')
  String zipCode;

  @JsonKey(name: 'geolocation')
  GeolocationItem geolocation;

  AddressItem({
    required this.city,
    required this.street,
    required this.number,
    required this.zipCode,
    required this.geolocation,
  });

  factory AddressItem.fromJson(Map<String, dynamic> json) =>
      _$AddressItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddressItemToJson(this);
}
