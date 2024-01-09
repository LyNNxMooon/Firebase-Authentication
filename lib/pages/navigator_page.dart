// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_shop/constant/colors.dart';

import 'package:i_shop/pages/home_page.dart';
import 'package:i_shop/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List<Widget> buildScreens() {
    return [const HomePage(), const ProfilePage()];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: kSecondaryColor,
          inactiveColorPrimary: kGreyColor),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          title: ("Profile"),
          activeColorPrimary: kSecondaryColor,
          inactiveColorPrimary: kGreyColor)
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : PersistentTabView(
            context,
            controller: controller,
            screens: buildScreens(),
            items: navBarItems(),
            confineInSafeArea: true,
            backgroundColor: kPrimaryColor,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
          );
  }
}
