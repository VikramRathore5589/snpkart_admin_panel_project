import 'package:flutter/foundation.dart';
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
  //
  // Future deleteProduct(productId) async {
  //   try {
  //     bool result = await productService.deleteProduct(productId);
  //     notifyListeners();
  //     if (result) {
  //       Util.flutterToast('Product deleted successfully');
  //     }
  //   } catch (e) {
  //     Util.flutterToast(e.toString());
  //   }
  // }
}
