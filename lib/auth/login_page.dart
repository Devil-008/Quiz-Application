import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/auth/sign_page.dart';
import 'package:quizapp/controller/auth_controller/login_controller.dart';
import 'package:quizapp/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text('Enter your details to login'),
            const SizedBox(height: 20),
            MyTextField(
                label: 'Email',
                icons: Icons.email,
                onchange: loginController.Email),
            const SizedBox(height: 10),
            MyTextField(
                label: 'Password',
                icons: Icons.lock,
                onchange: loginController.Password),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginController.onlogin();
                // Handle login logic here
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.to(() => signupPage());
                // Navigate to signup page
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
