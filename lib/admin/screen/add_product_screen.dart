import 'package:flutter/material.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Column(
        children: [
          UiHelper.customTextField(
              controller: nameController, hintText: 'Enter name'),
        ],
      ),
    );
  }
}
