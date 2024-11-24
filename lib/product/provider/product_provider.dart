import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';
import 'package:snpkart_admin_panel_project/product/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  String? errorMessage;
  List<ProductModel> productList = [];
  ProductService productService;

  ProductProvider(this.productService);

  Future fetchProduct() async {
    try {
      productList = await productService.fetchProduct();
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future deleteProduct(id) async {
    try {
      bool success = await productService.deleteProduct(id);

      if (success) {
        productList.removeWhere((product) => product.sId == id);
        notifyListeners();
        Util.flutterToast('Product deleted successfully');
      }
    } catch (e) {
      Util.flutterToast(e.toString());
    }
  }

  Future addProduct(ProductModel product) async {
    try {
      bool result = await productService.addProduct(product);
      notifyListeners();
      if (result) {
        Util.flutterToast('Product Added Successfully');
        return true;
      }
    } catch (e) {
      Util.flutterToast(e.toString());
      return false;
    }
  }

  Future updateProduct(String id, ProductModel productModel) async {
    try {
      bool success = await productService.updateProduct(id, productModel);
      notifyListeners();
      if (success) {
        Util.flutterToast('Product Added Successfully');
        return true;
      }
    } catch (e) {
      Util.flutterToast(e.toString());
      return false;
    }notifyListeners();
  }
}
