import 'package:flutter/foundation.dart';
import 'package:snpkart_admin_panel_project/auth/model/auth_model.dart';
import 'package:snpkart_admin_panel_project/auth/service/auth_service.dart';
import 'package:snpkart_admin_panel_project/core/app_util.dart';
import 'package:snpkart_admin_panel_project/core/storage_helper/storage_helper_class.dart';

class AuthProvider extends ChangeNotifier {
  AuthService authService;
   String? errorMessage;
//get AuthService class Object
  AuthProvider(this.authService);
//here call signUp function  get from AuthService(API)
  Future signUp(AuthModel authModel) async {
    try {
      bool success = await authService.signUp(authModel);
      if (success) {
        Util.flutterToast('Account Created successfully');
      }
    } catch (e) {
      Util.flutterToast(e.toString());
    } finally {
      notifyListeners();
    }
  }
//call LogIn function create in AuthService(API)
  Future<bool> logIn(AuthModel authModel) async {
    try {
      String? token = await authService.logIn(authModel);
      if (token.isNotEmpty) {
        await StorageHelper.saveToken(token);
        Util.flutterToast('Logged in successfully.');
        return true;
      } else {
        Util.flutterToast('Invalid username or password.');
        return false;
      }
    } catch (e) {
      Util.flutterToast('Error: ${e.toString()}');
      return false;
    } finally {
      notifyListeners();
    }
  }
  Future logOut() async {
    try {
      errorMessage = null;
      await StorageHelper.clearToken();

      // Util.flutterToast('Log out successfully');
      notifyListeners();
    } catch (e) {
      errorMessage = errorMessage.toString();
    }
  }
}
