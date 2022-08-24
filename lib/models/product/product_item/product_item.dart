import 'package:json_annotation/json_annotation.dart';

import '../rating_item/rating_item.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'title')
  String title;

  @JsonKey(defaultValue: 0, name: 'price')
  num price;

  @JsonKey(defaultValue: '', name: 'description')
  String description;

  @JsonKey(defaultValue: '', name: 'category')
  String category;

  @JsonKey(defaultValue: '', name: 'image')
  String image;

  @JsonKey(name: 'rating')
  RatingItem ratingItem;

  ProductItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingItem,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);

  @override
  String toString() => '''
      id:$id,
      ratingItem:${ratingItem.rate},
      descriptionL:$description,
      title:$title,
      category:$category,
      image:$image,
      price:$price,
  ''';
}
