import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

myLightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xff0a0e21),
      primarySwatch: Colors.purple,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blueAccent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 248, 248, 248),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 0,
        height: 100,
        indicatorColor: Color.fromARGB(255, 248, 248, 248),
        iconTheme: MaterialStateProperty.all(
          IconThemeData(
            size: 32,
          ),
        ),
      ),
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 30, color: Colors.black)));
}

myDarkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff0a0e21),
      primarySwatch: Colors.purple,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 176, 205, 255),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 248, 248, 248),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 0,
        height: 100,
        indicatorColor: Color.fromARGB(255, 248, 248, 248),
        iconTheme: MaterialStateProperty.all(IconThemeData(
          size: 32,
        )),
      ),
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 30, color: Colors.black)));
}
