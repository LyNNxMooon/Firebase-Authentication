// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';
import 'package:i_shop/constant/strings.dart';
import 'package:i_shop/widgets/button_widget.dart';
import 'package:i_shop/widgets/text_field_widget.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _emailController = TextEditingController();

  Future sendPasswordResetLink() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(kSuccessfulPasswordLinkSentText),
          );
        },
      );
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP25x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                kPasswordResetTitleText,
                style:
                    TextStyle(color: kSecondaryColor, fontSize: kFontSize18x),
                textAlign: TextAlign.center,
              ),
              const Gap(kSP30x),
              TextFieldWidget(
                hideText: false,
                hintText: 'Email',
                controller: _emailController,
              ),
              const Gap(kSP20x),
              ButtonSessionView(
                  function: sendPasswordResetLink, functionName: "Send")
            ],
          ),
        ),
      ),
    ));
  }
}
