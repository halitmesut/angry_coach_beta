import 'package:flutter/material.dart';

class LanguageAndCountryScreen extends StatefulWidget {
  const LanguageAndCountryScreen({Key? key}) : super(key: key);

  @override
  State<LanguageAndCountryScreen> createState() =>
      _LanguageAndCountryScreenState();
}

class _LanguageAndCountryScreenState extends State<LanguageAndCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language and country screen"),
      ),
    );
  }
}
