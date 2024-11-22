import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/dash_board_screen/dashboard_screen.dart';
import 'package:snpkart_admin_panel_project/product/screen/product_screen.dart';
import 'package:snpkart_admin_panel_project/splash/splash_provider.dart';
import 'package:snpkart_admin_panel_project/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    takeDesicion();
  }

  Future takeDesicion() async {
    SplashProvider splashProvider =
        Provider.of<SplashProvider>(context, listen: false);
    bool isLoggedIn = await splashProvider.checkLoggedIn();
    if (isLoggedIn) {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ));
      }
    } else {
      if(mounted){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ));
    }}
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text('SnapKart Screen'),
      ),
    );
  }
}
