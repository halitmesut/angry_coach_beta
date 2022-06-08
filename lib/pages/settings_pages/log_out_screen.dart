import 'package:flutter/material.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log out screen"),
      ),
    );
  }
}
