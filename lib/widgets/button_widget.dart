import 'package:flutter/material.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';

class ButtonSessionView extends StatelessWidget {
  const ButtonSessionView(
      {super.key, required this.function, required this.functionName});

  final VoidCallback function;
  final String functionName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.only(left: kSP20x, right: kSP20x, top: kSP5x),
        width: kTextFieldWidth,
        height: kTextFieldHeight,
        decoration: const BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              kSP20x,
            ),
          ),
        ),
        child: Center(
            child: Text(
          functionName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: kFontSize20x),
        )),
      ),
    );
  }
}
