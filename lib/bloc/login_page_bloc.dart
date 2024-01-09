import 'package:flutter/material.dart';
import 'package:i_shop/firebase/firebase_services.dart';

class LoginPageBloc extends ChangeNotifier {
  bool isDispose = false;

  final FirestoreServices _firestoreServices = FirestoreServices();

  void signIn(String email, String password, BuildContext context) {
    _firestoreServices.firebaseSignIn(email, password, context);

    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDispose = true;
    super.dispose();
  }
}
