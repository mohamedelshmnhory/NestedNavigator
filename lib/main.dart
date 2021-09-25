import 'package:flutter/material.dart';
import 'package:shormehh/modules/on_boarding_screen.dart';
import 'package:shormehh/shared/styles/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: OnBoardingScreen(),
    );
  }
}


