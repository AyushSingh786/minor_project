import 'package:esppr/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/customer_home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomerHomeScreen(),
      // WelcomeScreen(),
      // CustomerHomeScreen(),
    );
  }
}
