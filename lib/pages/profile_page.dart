import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:i_shop/constant/colors.dart';
import 'package:i_shop/constant/dimensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userEmail = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(kSP20x),
                  Text(
                    "User Email: ${userEmail?.email ?? ''}",
                    style: const TextStyle(color: kSecondaryColor),
                  ),
                  const Gap(kSP20x),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text("Log Out")),
                ],
              ),
            )));
  }
}
