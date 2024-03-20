// import 'dart:html';

// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/pages/HomePage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class authServices {
  // static final storage = new FlutterSecureStorage();
  static signUp(String email, String password, BuildContext context) async {
    if (email == null || password == null) {
      final snackBar = SnackBar(content: Text("Enter required field"));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      try {
        firebaseauth.UserCredential userCredential = await firebaseauth
            .FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // storeTokenAndData(userCredential);
        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        ;
      } on firebaseauth.FirebaseAuthException catch (e) {
        final snackBar = SnackBar(content: Text(e.toString()));
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  static logIn(String email, String password, BuildContext context) async {
    if (email == null || password == null) {
      final snackBar = SnackBar(content: Text("Enter required field"));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    try {
      firebaseauth.UserCredential userCredential = await firebaseauth
          .FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // storeTokenAndData(userCredential);
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      ;
    } on firebaseauth.FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // static storeTokenAndData(firebaseauth.UserCredential userCredential) async {

  //   await storage.write(
  //       key: 'token', value: userCredential.credential!.token.toString());
  //   await storage.write(
  //       key: "usercredential", value: userCredential.toString());
  // }

  // static getToken() async {
  //   String? token = await storage.read(key: "token");
  // }
}
