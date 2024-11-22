import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/auth/model/auth_model.dart';
import 'package:snpkart_admin_panel_project/auth/provider/auth_provider.dart';
import 'package:snpkart_admin_panel_project/auth/screen/log_in_screen.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future signUp() async {
      String username = usernameController.text;
      String password = passwordController.text;
      if (formKey.currentState!.validate()) {
        AuthModel authModel = AuthModel(username: username, password: password);

        AuthProvider authProvider =
            Provider.of<AuthProvider>(context, listen: false);
        await authProvider.signUp(authModel);
        if(context.mounted){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInScreen(),
            ));
      }}
    }

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/good_morning_img.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 150
                    // horizontal: 16.0,
                    // vertical: 70,
                    ),
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      UiHelper.customTextField(
                          inputType: TextInputType.text,
                          controller: usernameController,
                          hintText: 'Enter Username',
                          borderRadius: BorderRadius.circular(10)),
                      const SizedBox(
                        height: 16,
                      ),
                      UiHelper.customTextField(
                          inputType: const TextInputType.numberWithOptions(),
                          controller: passwordController,
                          hintText: 'Enter Password',
                          borderRadius: BorderRadius.circular(10)),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            signUp();
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.black),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account ?',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogInScreen(),
                                  ));
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.lime,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Forgot password ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
