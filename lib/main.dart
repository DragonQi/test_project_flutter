import 'package:flutter/material.dart';
import 'package:test_project/screens/auth_screen.dart';
import 'package:test_project/screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthScreen(),
    );
  }
}

