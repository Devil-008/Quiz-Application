import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/auth_controller/signup_controller.dart';

import '../widgets/text_field.dart';
import 'login_page.dart';

class signupPage extends StatelessWidget {
  signupPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create An Account',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            MyTextField(
                label: "User Name",
                icons: Icons.person,
                onchange: signupController.Name),
            SizedBox(height: 10),
            MyTextField(
                label: "Email",
                icons: Icons.email,
                onchange: signupController.Email),
            const SizedBox(height: 10),
            MyTextField(
                label: 'Password',
                icons: Icons.lock,
                onchange: signupController.Password),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signupController.Onsignup();
                // Handle signup logic here
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.to(() => const LoginPage());
                // Navigate to login page
              },
              child: const Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
