import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snpkart_admin_panel_project/core/api_endpoints_url.dart';
import 'package:snpkart_admin_panel_project/core/api_key.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProduct() async {
    String url = ApiUrl.fetchProductUrl;
    Response response = await http.get(Uri.parse(url),
        headers: {'x-api-key': ApiKey.apiKey});
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      final finalResult = result.map((e) => ProductModel.fromJson(e)).toList();
      return finalResult;
      // List<ProductModel> productList = [];
      // for (int item = 0; item < result.length; item++) {
      //   final map = result[item];
      //   ProductModel productModel = ProductModel.fromJson(map);
      //   productList.add(productModel);
      // }
    } else {
      throw 'Unable to fetch product';
    }
  }

  Future deleteProduct(id) async {
    String? token = await StorageHelper.getToken();
    String url = "${ApiUrl.deleteProductUrl}$id";
    Response response = await http.delete(Uri.parse(url), headers: {
      'x-api-key': ApiKey.apiKey,
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw 'Something went wrong';
    }
  }

  Future<bool> addProduct(ProductModel product) async {
    String? token = await StorageHelper.getToken();
    if (token == null) {
      throw 'Token is null Please pass Token';
    }
    final header = {'Content-Type': 'application/json',
      'x-api-key': ApiKey.apiKey,
      'Authorization': 'Bearer $token'};
    String url = ApiUrl.addProductUrl;
    String string = jsonEncode(product.toJson());

    Response response = await http.post(Uri.parse(url), body: string, headers: header);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Something went wrong';
    }
  }

  Future<bool> updateProduct(id, ProductModel productModel) async {
    String? token = await StorageHelper.getToken();
    final header={
      'Content-Type': 'application/json',
      'x-api-key': ApiKey.apiKey,
      'Authorization': 'Bearer $token'
    };
    String url = "${ApiUrl.updateProduct}$id";
    final encode = jsonEncode(productModel.toJson());
    Response response = await http.put(Uri.parse(url), body: encode, headers: header);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw 'Something went wrong';
    }
  }
}
