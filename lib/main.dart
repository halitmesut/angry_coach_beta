import 'dart:ui';

import 'package:angry_coach_beta/pages/introduction_pages/name.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  static const String title = "on boarding example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: const Color(0xff0a0e21),
        scaffoldBackgroundColor: const Color.fromARGB(255, 14, 19, 45),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        primarySwatch: Colors.purple,
      ),
      themeMode: ThemeMode.light,
      home: const NameScreen(),
    );
  }
}
