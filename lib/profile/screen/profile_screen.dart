import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/auth/provider/auth_provider.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/product/provider/product_provider.dart';
import 'package:snpkart_admin_panel_project/welcome_screen/welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: IconButton(
            onPressed: () async {
              AuthProvider authProvider =
              Provider.of<AuthProvider>(context, listen: false);
              await authProvider.logOut();
              if (authProvider.errorMessage == null) {
                if(context.mounted){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen(),));
              }}
            },
            icon: Icon(Icons.logout)),
      ),
    );
  }
}
