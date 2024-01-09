// ignore_for_file: use_build_context_synchronously, avoid_function_literals_in_foreach_calls

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  FirestoreServices._();
  static final FirestoreServices _singleton = FirestoreServices._();
  factory FirestoreServices() => _singleton;

  //
  //Authentication
  //

  //Sign Up User
  Future firebaseSignUp(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  //UserLogin
  Future firebaseSignIn(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }
}
