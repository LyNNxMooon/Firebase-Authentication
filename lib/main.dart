import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:i_shop/firebase_options.dart';
import 'package:i_shop/pages/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthPage(),
      theme: ThemeData(fontFamily: 'Cinzel'),
      debugShowCheckedModeBanner: false,
    );
  }
}
