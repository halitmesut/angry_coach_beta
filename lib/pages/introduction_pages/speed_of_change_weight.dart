import 'package:angry_coach_beta/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeedOfLooseWeightScreen extends StatefulWidget {
  const SpeedOfLooseWeightScreen({Key? key}) : super(key: key);

  @override
  State<SpeedOfLooseWeightScreen> createState() =>
      _SpeedOfLooseWeightScreenState();
}

class _SpeedOfLooseWeightScreenState extends State<SpeedOfLooseWeightScreen> {
  final _userSpeedOfLoseWeightInput = TextEditingController();
  String userSpeedOfLoseWeight = "";

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
                  "which is your Speed Of Lose Weight selection?",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: _userSpeedOfLoseWeightInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[1-3]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Make a choice",
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
                          _userSpeedOfLoseWeightInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              Text(
                '1 = slow',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2 = normal',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '3 = fast',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text("Next page", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userSpeedOfLoseWeight = _userSpeedOfLoseWeightInput.text;
                  if (userSpeedOfLoseWeight != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                    print(userSpeedOfLoseWeight);
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
