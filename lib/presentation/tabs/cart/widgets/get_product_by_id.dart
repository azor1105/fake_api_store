import 'package:fake_api_store/models/product/product_item/product_item.dart';

ProductItem? getProductById(
    {required List<ProductItem> products, required int id}) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].id == id) {
      return products[i];
    }
  }
  return null;
}
