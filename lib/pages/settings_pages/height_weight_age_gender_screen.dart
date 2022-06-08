import 'package:flutter/material.dart';

class HeightWeightAgeAndGenderScreen extends StatefulWidget {
  const HeightWeightAgeAndGenderScreen({Key? key}) : super(key: key);

  @override
  State<HeightWeightAgeAndGenderScreen> createState() =>
      _HeightWeightAgeAndGenderScreenState();
}

class _HeightWeightAgeAndGenderScreenState
    extends State<HeightWeightAgeAndGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Height Weight Age Gender"),
      ),
    );
  }
}
