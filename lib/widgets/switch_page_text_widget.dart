import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';

class SwitchPageTextSessionView extends StatelessWidget {
  const SwitchPageTextSessionView(
      {super.key,
      required this.switchPage,
      required this.switchText,
      required this.switchPageText});

  final VoidCallback switchPage;
  final String switchText;
  final String switchPageText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          switchText,
          style: const TextStyle(color: kSecondaryColor),
        ),
        const Gap(kSP10x),
        TextButton(onPressed: switchPage, child: Text(switchPageText))
      ],
    );
  }
}
