import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var darkMode = Hive.box("darkMode").get("darkMode", defaultValue: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification screen"),
      ),
      body: Center(
        child: Switch(
            value: darkMode,
            onChanged: (val) {
              Hive.box("darkMode").put("darkMode", !darkMode);
            }),
      ),
    );
  }
}
