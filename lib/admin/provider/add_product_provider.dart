import 'package:flutter/cupertino.dart';
import 'package:snpkart_admin_panel_project/admin/services/add_product_service.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';

class AddProductProvider extends ChangeNotifier {
  List<ProductModel> productModel = [];
  AddProductService addProductService;

  AddProductProvider(this.addProductService);

  Future addProduct(ProductModel product) async {
    try {
      bool result = await addProductService.addProduct(product);
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
}
