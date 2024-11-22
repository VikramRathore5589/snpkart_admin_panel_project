import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:snpkart_admin_panel_project/core/api_endpoints_url.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';

class AddProductService {
  Future<bool> addProduct(ProductModel product) async {
    String? token = await StorageHelper.getToken();
    if (token == null) {
      throw 'Token is null Please pass Token';
    }

    String url = ApiUrl.addProductUrl;
    String string = jsonEncode(product.toJson());

    Response response = await http.post(Uri.parse(url), body: string, headers: {
      'Content-Type': 'application/json',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Something went wrong';
    }
  }


}
