import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/category/provider/category_provider.dart';
import 'package:snpkart_admin_panel_project/category/screen/category_screen.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final categoryNameController = TextEditingController();
  final formKey=GlobalKey<FormState>();

  Future addCategory() async {
    if(formKey.currentState!.validate()){
    String name = categoryNameController.text;
    CategoryModel categoryModel = CategoryModel(name: name);
    CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    bool success = await categoryProvider.addCategory(categoryModel);
    if (success) {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoryScreen(),
            ));
      }
    } else {
      throw 'Unable to add Category';
    }
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add category'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UiHelper.customTextField(
                  controller: categoryNameController,
                  hintText: 'Enter category name'),
              const SizedBox(
                height: 16,
              ),
              UiHelper.customElevatedButton(
                  callback: () {
                    addCategory();
                  },
                  child: 'Add')
            ],
          ),
        ),
      ),
    );
  }
}
