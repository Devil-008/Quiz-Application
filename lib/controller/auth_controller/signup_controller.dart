import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void Onsignup() {
    print('signup request');
    print('Name : ' + Name.text);
    print('Email : ' + Email.text);
    print('Password : ' + Password.text);
    createAccount(Email.text, Password.text);
  }
 
  Future<String> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Account Created");
      return "Account Created";
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak password") {
        print("weak password");
        return "weak password";
      } else if (ex.code == "email-already-in-use") {
        print(" Email Already exists Login Please !!!!");
        return " Email Already exists Login Please !!!!";
      }
      return "";
    } catch (ex) {
      print('ex');
      return "";
    }
  }
}
