import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/admin/provider/add_product_provider.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';
import 'package:snpkart_admin_panel_project/product/screen/product_screen.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future addProducts() async {
      String name = nameController.text;
      int price = int.parse(priceController.text);
      String description = descController.text;
      String category = categoryController.text;
      if (formKey.currentState!.validate()) {
        ProductModel productModel = ProductModel(
            name: name,
            price: price,
            category: category,
            description: description);
        AddProductProvider addProductProvider =
            Provider.of<AddProductProvider>(context, listen: false);
      bool success=  await addProductProvider.addProduct(productModel);
        if (success) {
          if(context.mounted){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductScreen(),
              ));
        }} else {
          throw 'Unable to add Product try again Later';
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                UiHelper.customTextField(
                    controller: nameController, hintText: 'Enter name'),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    inputType: const TextInputType.numberWithOptions(),
                    controller: priceController,
                    hintText: 'Enter price'),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    maxLine: 3,
                    controller: descController,
                    hintText: 'Enter description'),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    controller: categoryController, hintText: 'Enter category'),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customElevatedButton(
                    callback: () {
                      addProducts();
                    },
                    child: 'Add')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
