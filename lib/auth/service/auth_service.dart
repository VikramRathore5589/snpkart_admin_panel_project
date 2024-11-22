import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snpkart_admin_panel_project/auth/model/auth_model.dart';
import 'package:snpkart_admin_panel_project/core/api_endpoints_url.dart';

class AuthService {
  //SignUp API Function
  Future<bool> signUp(AuthModel authModel) async {
    String url = ApiUrl.signUpUrl;
    final encode = jsonEncode(authModel.toJson());

    Response response = await http.post(Uri.parse(url),
        body: encode, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {

      return true;
    } else {
      throw Exception('Invalid Username and Password');
    }
  }
//Login API Function
  Future<String> logIn(AuthModel authModel) async {
    String url = ApiUrl.loginUrl;
    final encode = jsonEncode(authModel.toJson());
    Response response = await http.post(Uri.parse(url),
        body: encode, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      String data = response.body;
      final map = jsonDecode(data);
      String token = map['token'];
      return token;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
