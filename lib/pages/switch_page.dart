import 'package:flutter/material.dart';
import 'package:i_shop/pages/login_page.dart';
import 'package:i_shop/pages/sign_up_page.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool isSwitchPage = true;

  void toggleScreens() {
    setState(() {
      isSwitchPage = !isSwitchPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSwitchPage) {
      return LoginPage(change: toggleScreens);
    } else {
      return SignUpPage(change: toggleScreens);
    }
  }
}
