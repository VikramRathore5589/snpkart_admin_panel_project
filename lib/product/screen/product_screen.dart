import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/product/screen/add_product_screen.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/product/model/product_model.dart';
import 'package:snpkart_admin_panel_project/product/provider/product_provider.dart';
import 'package:snpkart_admin_panel_project/product/screen/product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProduct();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: Util.appBar('Products', Icon(Icons.search),(){}),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.productList.isEmpty) {
            return Center(
              child: provider.errorMessage == null
                  ? const Text(
                      'No items in product screen',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  : Text(
                      'Failed to fetch products: ${provider.errorMessage}',
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                ProductModel product = provider.productList[index];
                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title:
                                const Text('Are you sure to delete this item'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    provider.deleteProduct(product.sId);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'))
                            ],
                          );
                        });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      title: Text(product.name ?? 'No product name'),
                      subtitle: Text(" Rs.${product.price.toString()}"),
                      trailing: Text(product.description ?? 'No category'),
                      leading: Text(product.iV.toString()),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
