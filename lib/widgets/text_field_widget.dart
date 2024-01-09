import 'package:flutter/material.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.hideText});

  final String hintText;
  final TextEditingController controller;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kSP20x, right: kSP20x, top: kSP5x),
      width: kTextFieldWidth,
      height: kTextFieldHeight,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            kSP20x,
          ),
        ),
      ),
      child: TextField(
        obscureText: hideText,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: kSecondaryColor),
            focusedBorder:
                const UnderlineInputBorder(borderSide: BorderSide.none)),
        style: const TextStyle(color: kSecondaryColor),
      ),
    );
  }
}
