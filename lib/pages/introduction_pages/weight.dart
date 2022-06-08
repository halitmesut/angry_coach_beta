import 'package:angry_coach_beta/pages/introduction_pages/target_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final _userWeightInput = TextEditingController();
  String userWeight = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "What's Your Weight?",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                maxLength: 3,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: _userWeightInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Your Weight",
                    hintStyle: TextStyle(color: Colors.grey),
                    helperStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _userWeightInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child:
                    Text("Next pagee", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userWeight = _userWeightInput.text;
                  if (userWeight != "" &&
                      userWeight.length > 1 &&
                      int.parse(userWeight) > 40 &&
                      int.parse(userWeight) < 180) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TargetWeightScreen()),
                    );
                    print(userWeight);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
