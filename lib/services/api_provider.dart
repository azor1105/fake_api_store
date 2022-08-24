import 'dart:convert';

import 'package:fake_api_store/models/cart/cart_item/cart_item.dart';
import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/models/user/user_item/user_item.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class ApiProvider {
  // getting all products
  Future<List<ProductItem>> getAllProducts() async {
    try {
      Response response =
          await https.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // getting by single id
  Future<ProductItem> getProductById({required int id}) async {
    try {
      Response response =
          await https.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        ProductItem gotProductById =
            ProductItem.fromJson(jsonDecode(response.body));
        return gotProductById;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // getting by limited count
  Future<List<ProductItem>> getByLimitedCount({required int limit}) async {
    try {
      Response response = await https
          .get(Uri.parse('https://fakestoreapi.com/products?limit=$limit'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // getting sorted products by id
  Future<List<ProductItem>> getSortedProductsById(
      {required String sortKey}) async {
    try {
      Response response = await https
          .get(Uri.parse('https://fakestoreapi.com/products?sort=$sortKey'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // getting all categories
  Future<List<String>> getAllCategories() async {
    try {
      Response response = await https
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // getting products by category specificly
  Future<List<ProductItem>> gettingProductsByCategory(
      {required String categoryName}) async {
    try {
      Response response = await https.get(Uri.parse(
          'https://fakestoreapi.com/products/category/$categoryName'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<UserItem>> getAllUsers() async {
    try {
      Response response =
          await https.get(Uri.parse('https://fakestoreapi.com/users'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<UserItem> users = (jsonDecode(response.body) as List?)
                ?.map((json) => UserItem.fromJson(json))
                .toList() ??
            [];
        return users;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserItem> getUserById({required int id}) async {
    try {
      Response response =
          await https.get(Uri.parse("https://fakestoreapi.com/users/$id"));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return UserItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CartItem>> getAllCarts() async {
    try {
      Response response =
          await https.get(Uri.parse('https://fakestoreapi.com/carts'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<CartItem> carts = (jsonDecode(response.body) as List?)
                ?.map((json) => CartItem.fromJson(json))
                .toList() ??
            [];
        return carts;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CartItem>> getCartByUserId({required int id}) async {
    try {
      Response response =
          await https.get(Uri.parse("https://fakestoreapi.com/carts/user/$id"));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        List<CartItem> cartsOfUser = (jsonDecode(response.body) as List?)
                ?.map((json) => CartItem.fromJson(json))
                .toList() ??
            [];
        return cartsOfUser;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // adding product to server
  Future<bool> addingProduct(ProductItem productItem) async {
    try {
      Response response = await https.post(
        Uri.parse('https://fakestoreapi.com/products'),
        body: productItem.toJson(),
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // adding cart to server
  Future<bool> addingCart({
    required String dateTime,
    required int userId,
    required int productId,
    required int quantity,
  }) async {
    Response response = await https.post(
      Uri.parse('https://fakestoreapi.com/carts'),
      body: jsonEncode({
        "userId": userId,
        "date": dateTime,
        "products": [
          {"productId": productId, "quantity": quantity}
        ]
      }),
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> loginUser(
      {required String userName, required String password}) async {
    try {
      Response response = await https.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        body: {'username': userName, 'password': password},
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return jsonDecode(response.body)['token'];
      } else {
        return '';
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
