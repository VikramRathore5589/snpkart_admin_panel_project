import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/core/api_endpoints_url.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';

class AddCategoryService {
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
