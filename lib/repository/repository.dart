import 'package:fake_api_store/models/cart/cart_item/cart_item.dart';
import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/models/user/user_item/user_item.dart';
import 'package:fake_api_store/services/api_provider.dart';

class Repository {
  Repository({required this.apiProvider});
  final ApiProvider apiProvider;

  // Api provider methods
  Future<List<ProductItem>> getAllProducts() async =>
      apiProvider.getAllProducts();

  Future<ProductItem> getProductById({required int id}) =>
      apiProvider.getProductById(id: id);

  Future<List<ProductItem>> getProductByLimitedCounts({required int limit}) =>
      apiProvider.getByLimitedCount(limit: limit);

  Future<List<ProductItem>> getProductBySortedId({required String sortKey}) =>
      apiProvider.getSortedProductsById(sortKey: sortKey);

  Future<List<String>> getAllCategories() async =>
      apiProvider.getAllCategories();

  Future<List<UserItem>> getAllUsers() async => apiProvider.getAllUsers();

  Future<List<CartItem>> getAllCarts() async => apiProvider.getAllCarts();

  Future<List<CartItem>> getCartByUserId({required int id}) async =>
      apiProvider.getCartByUserId(id: id);

  Future<List<ProductItem>> getProductByCategory(
          {required String categoryName}) async =>
      apiProvider.gettingProductsByCategory(categoryName: categoryName);

  Future<bool> addNewProduct(ProductItem productItem) =>
      apiProvider.addingProduct(productItem);

  Future<bool> addNewCart({
    required String dateTime,
    required int userId,
    required int productId,
    required int quantity,
  }) async =>
      apiProvider.addingCart(
        dateTime: dateTime,
        userId: userId,
        productId: productId,
        quantity: quantity,
      );

  Future<String> loginUser(
      {required String userName, required String password}) async {
    return apiProvider.loginUser(userName: userName, password: password);
  }

  Future<UserItem> getUserById({required int id}) async {
    return apiProvider.getUserById(id: id);
  }
}
