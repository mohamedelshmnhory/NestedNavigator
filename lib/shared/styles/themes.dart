import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: defaultColor2,
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black, // navigation bar color
    ),
    elevation: 1.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins-Regular',
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 0,
    // selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: 'Poppins-Regular',
    ),
  ),
  fontFamily: 'Poppins-Regular',
);
