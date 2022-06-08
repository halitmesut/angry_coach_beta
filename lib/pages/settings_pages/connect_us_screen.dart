import 'package:flutter/material.dart';

class ConnectUsScreen extends StatefulWidget {
  const ConnectUsScreen({Key? key}) : super(key: key);

  @override
  State<ConnectUsScreen> createState() => _ConnectUsScreenState();
}

class _ConnectUsScreenState extends State<ConnectUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connent us screen"),
      ),
    );
  }
}
