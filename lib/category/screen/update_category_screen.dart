import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/category/provider/category_provider.dart';
import 'package:snpkart_admin_panel_project/category/screen/category_screen.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';

class UpdateCategoryScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const UpdateCategoryScreen({super.key, required this.categoryModel});

  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  final nameController = TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.categoryModel.name ?? 'N/A';
  }

  Future updateCategory(id) async {
    if (formKey.currentState!.validate()) {
      String name = nameController.text;
      CategoryModel categoryModel = CategoryModel(name: name);
      CategoryProvider categoryProvider =
      Provider.of<CategoryProvider>(context, listen: false);
      bool success = await categoryProvider.updateCategory(categoryModel, id);
      if (success) {
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(),
              ));
        }
      }
      else {
        //Not do any operation and stay on live screen
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Category'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UiHelper.customTextField(
                  controller: nameController, hintText: 'update Category name'),
              const SizedBox(
                height: 16,
              ),
              UiHelper.customElevatedButton(callback: () {
                updateCategory(widget.categoryModel.sId);
              }, child: 'Update Category')
            ],
          ),
        ),
      ),
    );
  }
}
