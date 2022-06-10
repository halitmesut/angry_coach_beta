import 'package:flutter/material.dart';

class RecalculateMyDailyCaloriesScreen extends StatefulWidget {
  const RecalculateMyDailyCaloriesScreen({Key? key}) : super(key: key);

  @override
  State<RecalculateMyDailyCaloriesScreen> createState() =>
      _RecalculateMyDailyCaloriesScreenState();
}

class _RecalculateMyDailyCaloriesScreenState
    extends State<RecalculateMyDailyCaloriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recalculate Daily Calories"),
      ),
    );
  }
}
