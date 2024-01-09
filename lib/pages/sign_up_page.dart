import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:i_shop/bloc/signup_page_bloc.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';
import 'package:i_shop/constant/images.dart';
import 'package:i_shop/constant/strings.dart';
import 'package:i_shop/widgets/button_widget.dart';

import 'package:i_shop/widgets/switch_page_text_widget.dart';

import 'package:i_shop/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback change;
  const SignUpPage({super.key, required this.change});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpPageBloc>(
      create: (context) => SignUpPageBloc(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: kLogoImageWidth,
                  height: kLogoImageHeight,
                  child: Image.asset(
                    kLogoImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(kSP40x),
                const Text(
                  kRegisterTitleText,
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: kFontSize30x,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Gap(kSP60x),
                TextFieldWidget(
                  hideText: false,
                  hintText: 'Email',
                  controller: emailController,
                ),
                const Gap(kSP20x),
                TextFieldWidget(
                  hideText: true,
                  hintText: 'Password',
                  controller: passwordController,
                ),
                const Gap(kSP20x),
                TextFieldWidget(
                  hideText: true,
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                ),
                const Gap(kSP20x),
                Consumer<SignUpPageBloc>(
                  builder: (context, __, ___) {
                    final bloc = context.read<SignUpPageBloc>();
                    return ButtonSessionView(
                        function: () => bloc.signUp(
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                            context),
                        functionName: "Register");
                  },
                ),
                const Gap(kSP20x),
                SwitchPageTextSessionView(
                    switchPage: widget.change,
                    switchText: kLoginText,
                    switchPageText: "Sign In")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
