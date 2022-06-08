import 'package:flutter/material.dart';

class PrivacyAndSecurityScreen extends StatefulWidget {
  const PrivacyAndSecurityScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyAndSecurityScreen> createState() =>
      _PrivacyAndSecurityScreenState();
}

class _PrivacyAndSecurityScreenState extends State<PrivacyAndSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("privact and security screen"),
      ),
    );
  }
}
