import 'package:flutter/foundation.dart';
import 'package:snpkart_admin_panel_project/auth/model/auth_model.dart';
import 'package:snpkart_admin_panel_project/auth/service/auth_service.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';

class AuthProvider extends ChangeNotifier {
  AuthService authService;
  // bool isAuthenticated=true;

  AuthProvider(this.authService);

  Future signUp(AuthModel authModel) async {
    try {
      bool success = await authService.signUp(authModel);
      notifyListeners();
      if (success) {
         Util.flutterToast('Account Created successfully');
      }
    } catch (e) {
      // return false;
      Util.flutterToast(e.toString());
    }
  }
  Future<bool> logIn(AuthModel authModel) async {
    try {
      String? token = await authService.logIn(authModel);

      if (token != null && token.isNotEmpty) {
        await StorageHelper.saveToken(token);
        notifyListeners();
        Util.flutterToast('Logged in successfully.');
        return true;
      } else {
        Util.flutterToast('Invalid username or password.');
        return false;
      }
    } catch (e) {
      Util.flutterToast('Error: ${e.toString()}');
      return false;
    }
  }


}
