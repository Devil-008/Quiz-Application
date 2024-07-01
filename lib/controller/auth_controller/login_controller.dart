import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizapp/homepage.dart';

class LoginController extends GetxController {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void onlogin() {
    print('login  request');
    print('Email : ' + Email.text);
    print('Password : ' + Password.text);
    signIn(Email.text, Password.text);
  }

  Future<void> signIn(String Email, String Password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      print("login ");
      Get.offAll(Homepage());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        print("Email id does not exists");
      } else if (ex.code == "wrong-password") {
        print("Wrong password");
      }
    }
  }
}
