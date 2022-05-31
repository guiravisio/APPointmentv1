import 'package:flutter/material.dart';

import 'firebase_options.dart';

import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APPointment',
      initialRoute: 'login',
      routes: {
        'login': (context) => const FirstPageLogin(),
        'criar_conta': (context) => const Register(),
        'principal': (context) => const Home(),
      },
    ),
  );
}
