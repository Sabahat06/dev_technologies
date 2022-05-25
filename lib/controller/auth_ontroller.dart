import 'package:dev_technologies_task/view/home_screen.dart';
import 'package:dev_technologies_task/view/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool progressing = false.obs;
  RxString errorMessage = ''.obs;
  final auth = FirebaseAuth.instance;

  signUp(String email, String password) async {
    progressing.value = true;
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
          saveLoginValue(true),
          Get.offAll(() => HomePageScreen()),
          progressing.value = false
      })
        .catchError((e) {
        Fluttertoast.showToast(msg: e.message, backgroundColor: Colors.greenAccent[400], fontSize: 16, textColor: Colors.white,);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage.value = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage.value = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage.value = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage.value = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage.value = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage.value = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage.value = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage.value, backgroundColor: Colors.greenAccent[400], fontSize: 16, textColor: Colors.white);
      print(error.code);
    }
    progressing.value = false;
  }

  void signIn(String email, String password) async {
    progressing.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
         saveLoginValue(true),
         Get.offAll(() => HomePageScreen()),
         progressing.value = false
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage.value = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage.value = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage.value = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage.value = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage.value = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage.value = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage.value = "An undefined Error happened.";
      }
      progressing.value = false;
      Fluttertoast.showToast(msg: errorMessage.value, backgroundColor: Colors.greenAccent[400], fontSize: 16, textColor: Colors.white);
      print(error.code);
    }
  }


  saveLoginValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', value);
  }

  Future<void> logout() async {
    saveLoginValue(false);
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => StartPageScreen());
  }

}