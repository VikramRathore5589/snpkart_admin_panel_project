import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snpkart_admin_panel_project/auth/model/auth_model.dart';
import 'package:snpkart_admin_panel_project/auth/provider/auth_provider.dart';
import 'package:snpkart_admin_panel_project/auth/screen/sign_up_screen.dart';
import 'package:snpkart_admin_panel_project/core/ui_helper/ui_helper.dart';
import 'package:snpkart_admin_panel_project/dash_board_screen/dashboard_screen.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future logInAccount() async {
      String email = emailController.text;
      String password = passwordController.text;
      if (formKey.currentState!.validate()) {
        AuthModel authModel = AuthModel(email: email, password: password);
        AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
        bool success = await authProvider.logIn(authModel);
        if (success) {
          if(context.mounted){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );}
        } else {
          // Not do any operation and stay on current screen
        }
      }
    }

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome back you've been missed!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    UiHelper.customTextField(
                        controller: emailController, hintText: 'Enter Email'),
                    const SizedBox(
                      height: 16,
                    ),
                    UiHelper.customTextField(controller: passwordController,inputType: const TextInputType.numberWithOptions(),
                        hintText: 'Enter Password'),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        logInAccount();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Continue with'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imageContainer('assets/images/google.png'),
                        const SizedBox(
                          width: 16,
                        ),
                        imageContainer('assets/images/apple.png')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a Member?'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ));
                            },
                            child: const Text('Register Now'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container imageContainer(String image) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[100]!, width: 2),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white),
      child: Center(
        child: Image.asset(
          image,
          height: 50,
        ),
      ),
    );
  }
}
// body: SingleChildScrollView(
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Form(
//       key: formKey,
//       child: Column(
//         children: [
//           Image.asset(
//             'assets/images/friendship.png',
//             height: MediaQuery.of(context).size.height * 0.3,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           const Center(
//               child: Text(
//             'LOG IN',
//             style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
//           )),
//           const SizedBox(
//             height: 16,
//           ),
//           TextFormField(
//             controller: emailController,
//             decoration: InputDecoration(
//                 hintText: 'Enter username',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8))),
//             validator: (String? value) {
//               if (value == null || value.isEmpty) {
//                 return 'This field are required';
//               }
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           TextFormField(keyboardType: const TextInputType.numberWithOptions(),
//             controller: passwordController,
//             decoration: InputDecoration(
//                 hintText: 'Enter password',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8))),
//             validator: (String? value) {
//               if (value == null || value.isEmpty) {
//                 return 'password must be required';
//               }
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.lime[100],
//                   foregroundColor: Colors.black),
//               onPressed: () {
//                 logInAccount();
//               },
//               child: const Text(
//                 'Log In',
//                 style: TextStyle(color: Colors.black),
//               )),
//           const SizedBox(
//             height: 16,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(' Do you have no Account'),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SignUpScreen(),
//                       ));
//                 },
//                 child: const Text('SIGN UP'),
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
// ),
