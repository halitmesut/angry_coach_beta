import 'package:flutter/material.dart';

class NameAndEmailScreen extends StatefulWidget {
  const NameAndEmailScreen({Key? key}) : super(key: key);

  @override
  State<NameAndEmailScreen> createState() => _NameAndEmailScreenState();
}

class _NameAndEmailScreenState extends State<NameAndEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name and Email Setting"),
      ),
    );
  }
}
