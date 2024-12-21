import 'package:flutter/foundation.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/category/service/category_service.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  CategoryService categoryService;

  CategoryProvider(this.categoryService);

  Future getCategory() async {
    try {
      categoryList = await categoryService.getAllCategory();
    } catch (e) {
      Util.flutterToast(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future deleteCategory(categoryId) async {
    try {
      bool success = await categoryService.deleteCategory(categoryId);
      if (success) {
        categoryList.removeWhere((category) => category.sId == categoryId);
        notifyListeners();
        Util.flutterToast('Category Deleted Successfully');
      }
    } catch (e) {
      Util.flutterToast(e.toString());
    }
  }

  Future addCategory(CategoryModel categoryModel) async {
    try {
      bool success = await categoryService.addCategory(categoryModel);
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

  Future updateCategory(CategoryModel categoryModel, id) async {
    try {
      bool success = await categoryService.updateCategory(categoryModel, id);
      if (success) {
        Util.flutterToast('Category Updated Successfully');
        return true;
      }
    } catch (e) {
      Util.flutterToast(e.toString());
      return false;
    }
  }
}
