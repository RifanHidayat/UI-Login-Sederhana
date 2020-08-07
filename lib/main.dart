import 'package:flutter/material.dart';
import 'package:loginsederhana/UI/login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Sederhana",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );

  }

}


