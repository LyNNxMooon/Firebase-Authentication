import 'package:flutter/material.dart';
import 'package:i_shop/constant/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text("Home Page"),
      ),
    ));
  }
}
