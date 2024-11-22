import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/admin/provider/add_category_provider.dart';
import 'package:snpkart_admin_panel_project/admin/provider/add_product_provider.dart';
import 'package:snpkart_admin_panel_project/admin/screen/add_product_screen.dart';
import 'package:snpkart_admin_panel_project/auth/provider/auth_provider.dart';
import 'package:snpkart_admin_panel_project/auth/screen/sign_up_screen.dart';
import 'package:snpkart_admin_panel_project/auth/service/auth_service.dart';
import 'package:snpkart_admin_panel_project/category/provider/category_provider.dart';
import 'package:snpkart_admin_panel_project/product/provider/product_provider.dart';
import 'package:snpkart_admin_panel_project/product/service/product_service.dart';
import 'package:snpkart_admin_panel_project/splash/splash_provider.dart';
import 'package:snpkart_admin_panel_project/splash/splash_screen.dart';
import 'package:snpkart_admin_panel_project/welcome_screen/welcome_screen.dart';

import 'admin/services/add_category_service.dart';
import 'admin/services/add_product_service.dart';
import 'category/service/category_service.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthService authService = AuthService();
    // ProductService productService=ProductService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(AuthService()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(ProductService()),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(CategoryService()),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProductProvider(AddProductService()),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),ChangeNotifierProvider(create: (context) => AddCategoryProvider(AddCategoryService()),)
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
