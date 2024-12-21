import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/category/screen/add_category_screen.dart';
import 'package:snpkart_admin_panel_project/category/model/category_model.dart';
import 'package:snpkart_admin_panel_project/category/provider/category_provider.dart';
import 'package:snpkart_admin_panel_project/category/screen/category_detail_screen.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getCategory();
    return Scaffold(
      floatingActionButton: UiHelper.customFloatingActionButton(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCategoryScreen(),
            ));
      }, const Icon(Icons.add)),
      appBar: Util.appBar('Categories',Icon(Icons.search),(){}),
      body: Consumer<CategoryProvider>(builder: (context, provider, child) {
        if (provider.categoryList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              CategoryModel items = provider.categoryList[index];
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Are you sure to delete this category'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  provider.deleteCategory(items.sId);
                                  Navigator.pop(context);
                                },
                                child: Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No'))
                          ],
                        );
                      });
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailScreen(categoryModel: items),
                      ));
                },
                child: Card(
                  child: ListTile(
                    title:Text(items.name??'No name'),
                    subtitle: Text(items.sId ?? 'No sId'),
                    trailing: Text(items.iV.toString()),
                  ),
                ),
              );
            },
            itemCount: provider.categoryList.length,
          );
        }
      }),
    );
  }
}
