import 'package:flutter/material.dart';
import 'package:snpkart_admin_panel_project/admin/services/add_category_service.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';


class AddCategoryProvider extends ChangeNotifier {
  List<CategoryModel> categoryModel = [];
  AddCategoryService addCategoryService;

  AddCategoryProvider(this.addCategoryService);

  Future addCategories(CategoryModel categoryModel) async {
    try {
      bool success = await addCategoryService.addCategory(categoryModel);
      notifyListeners();
      if (success) {
        Util.flutterToast('New category Added Successfully');
        return true;
      }
    } catch (e) {
      Util.flutterToast(e.toString());
      return false;
    }
  }
}
