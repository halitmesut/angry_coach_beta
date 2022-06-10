import 'package:angry_coach_beta/pages/introduction_pages/activity.dart';
import 'package:angry_coach_beta/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TargetWeightScreen extends StatefulWidget {
  const TargetWeightScreen({Key? key}) : super(key: key);

  @override
  State<TargetWeightScreen> createState() => _TargetWeightScreenState();
}

class _TargetWeightScreenState extends State<TargetWeightScreen> {
  @override
  final _userTargetWeightInput = TextEditingController();
  String userTargetWeight = "";

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
                  "What's Your Target Weight?",
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
                controller: _userTargetWeightInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Your Target Weight",
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
                          _userTargetWeightInput.clear();
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
                  userTargetWeight = _userTargetWeightInput.text;
                  if (userTargetWeight != "" &&
                      userTargetWeight.length > 1 &&
                      int.parse(userTargetWeight) > 49 &&
                      int.parse(userTargetWeight) < 160) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityScreen()),
                    );
                    print(userTargetWeight);
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
