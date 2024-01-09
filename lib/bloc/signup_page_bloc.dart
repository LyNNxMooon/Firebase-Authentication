import 'package:flutter/material.dart';
import 'package:i_shop/constant/strings.dart';
import 'package:i_shop/firebase/firebase_services.dart';

class SignUpPageBloc extends ChangeNotifier {
  bool isDispose = false;

  final FirestoreServices _firestoreServices = FirestoreServices();

  void signUp(String email, String password, String confirmPassword,
      BuildContext context) {
    if (password == confirmPassword) {
      _firestoreServices.firebaseSignUp(email, password, context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(kConfirmPasswordErrorText),
          );
        },
      );
    }

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
