import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:i_shop/bloc/login_page_bloc.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';
import 'package:i_shop/constant/images.dart';
import 'package:i_shop/constant/strings.dart';
import 'package:i_shop/pages/password_reset_page.dart';
import 'package:i_shop/widgets/button_widget.dart';
import 'package:i_shop/widgets/switch_page_text_widget.dart';

import 'package:i_shop/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback change;
  const LoginPage({super.key, required this.change});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageBloc>(
      create: (context) => LoginPageBloc(),
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
                  kLogInTitleText,
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
                const Gap(kSP5x),
                Padding(
                  padding: const EdgeInsets.only(right: kSP50x),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PasswordResetPage(),
                              )),
                          child: const Text("Forgot Password?"))
                    ],
                  ),
                ),
                const Gap(kSP5x),
                Consumer<LoginPageBloc>(
                  builder: (context, __, ___) {
                    final bloc = context.read<LoginPageBloc>();
                    return ButtonSessionView(
                        function: () => bloc.signIn(emailController.text,
                            passwordController.text, context),
                        functionName: "Log In");
                  },
                ),
                const Gap(kSP20x),
                SwitchPageTextSessionView(
                    switchPage: widget.change,
                    switchText: kRegisterText,
                    switchPageText: "Sign Up")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
