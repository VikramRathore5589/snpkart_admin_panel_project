import 'package:flutter/foundation.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/category/service/category_service.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categoryList=[];
  CategoryService categoryService;

  CategoryProvider(this.categoryService);

  Future getCategory() async {
    try {
      categoryList = await categoryService.getAllCategory();
      notifyListeners();
    } catch (e) {
      Util.flutterToast(e.toString());
    }
  }
}
