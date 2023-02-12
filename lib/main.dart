import 'package:flutter/material.dart';
import 'SignUp_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.tealAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: Scaffold(
        body: SignUpScreen(),
      ),),
    );
  }
}
