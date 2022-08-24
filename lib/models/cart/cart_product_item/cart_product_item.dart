import 'package:json_annotation/json_annotation.dart';

part 'cart_product_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductItemOfCart {
  @JsonKey(defaultValue: 0, name: 'productId')
  int productId;

  @JsonKey(defaultValue: 0, name: 'quantity')
  int quantity;

  ProductItemOfCart({
    required this.productId,
    required this.quantity,
  });

  factory ProductItemOfCart.fromJson(Map<String, dynamic> json) =>
      _$ProductItemOfCartFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemOfCartToJson(this);
}
