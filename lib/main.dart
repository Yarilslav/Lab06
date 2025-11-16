import 'package:flutter/material.dart';
import './widgets/sign_in_screen.dart';
import './widgets/signup_screen.dart';
import './widgets/reset_password_screen.dart';
import '../main.dart'; //

final List<Map<String, String>> registeredUsers = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '32-ICT: Yaroslav\'s Lab 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const SignInScreen(),
    );
  }
}
