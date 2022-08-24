import 'package:fake_api_store/models/cart/cart_product_item/cart_product_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'userId')
  int userId;

  @JsonKey(defaultValue: '', name: 'date')
  String dateTime;

  @JsonKey(name: 'products')
  List<ProductItemOfCart> products;

  CartItem({
    required this.id,
    required this.userId,
    required this.dateTime,
    required this.products,
  });

    factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}


// flutter packages pub run build_runner build --delete-conflicting-outputs
// MAGIC COMMAND