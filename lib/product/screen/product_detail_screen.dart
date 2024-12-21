import 'package:flutter/material.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';
import 'package:snpkart_admin_panel_project/product/screen/update_product_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.appBar('Product Detail', const Icon(Icons.edit), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateProduct(
                product: product,
              ),
            ));
      }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name ?? 'No Name',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                "Price: Rs. ${product.price?.toString() ?? 'No price'}",
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
              const SizedBox(height: 16),
              Text(
                "Category: ${product.categoryId ?? 'No Category'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text("Discount: ${product.discountAmount}"),
              const SizedBox(height: 16),
              Text(
                "Description: ${product.description ?? 'No Description'}",
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
