import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/core/api_endpoints_url.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';

class CategoryService {
  Future<List<CategoryModel>> getAllCategory() async {
    String url = ApiUrl.getCategoryUrl;
    Response response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(
        response.body,
      );
      final finalResult = result.map((e) => CategoryModel.fromJson(e)).toList();
      return finalResult;
    } else {
      throw 'Something went wrong';
    }
  }

  Future deleteCategory(categoryId) async {
    String? token = await StorageHelper.getToken();
    String url = "${ApiUrl.deleteCategory}$categoryId";
    Response response = await http.delete(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw 'Something went Wrong';
    }
  }

  Future<bool> addCategory(CategoryModel categoryModel) async {
    String? token = await StorageHelper.getToken();
    if (token == null) {
      throw 'Token is Null';
    }

    String url = ApiUrl.addCategoryUrl;
    String encode = jsonEncode(categoryModel.toJson());
    Response response = await http.post(Uri.parse(url), body: encode, headers: {
      'Content-Type': 'application/json',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Invalid token';
    }
  }
}
