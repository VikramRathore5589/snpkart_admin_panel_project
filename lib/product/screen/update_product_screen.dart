import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';
import 'package:snpkart_admin_panel_project/product/provider/product_provider.dart';
import 'package:snpkart_admin_panel_project/product/screen/product_screen.dart';

class UpdateProduct extends StatefulWidget {
  final ProductModel product;

  const UpdateProduct({super.key, required this.product});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  @override
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.product.name ?? 'No name';
    priceController.text = widget.product.price.toString();
    descController.text = widget.product.description ?? 'No description';
    categoryController.text = widget.product.category ?? 'N/A ';
    super.initState();
  }

  Future updateProduct(ProductModel productModel, id) async {
    String name = nameController.text;
    int price = int.parse(priceController.text);
    String desc = descController.text;
    String category = categoryController.text;
    ProductModel productModel = ProductModel(
        name: name, price: price, description: desc, category: category
    );
    ProductProvider productProvider =
    Provider.of<ProductProvider>(context, listen: false);
    bool success = await productProvider.updateProduct(id, productModel);
    if (success) {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(),
            ));
      }
    } else {
      //Todo Not do any operation
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UiHelper.customTextField(
                  controller: nameController, hintText: 'Update Product name'),
              SizedBox(
                height: 16,
              ),
              UiHelper.customTextField(
                  controller: priceController,
                  hintText: 'Update Product price'),
              SizedBox(
                height: 16,
              ),
              UiHelper.customTextField(
                  controller: descController,
                  hintText: 'Update Product Description'),
              SizedBox(
                height: 16,
              ),
              UiHelper.customTextField(
                  controller: categoryController,
                  hintText: 'Update Product category'),
              SizedBox(
                height: 16,
              ),
              UiHelper.customElevatedButton(callback: () {
                updateProduct(widget.product, widget.product.sId);
              }, child: 'Update')
            ],
          ),
        ),
      ),
    );
  }
}
