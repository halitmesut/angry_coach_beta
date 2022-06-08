import 'package:angry_coach_beta/pages/introduction_pages/weight.dart';
import 'package:angry_coach_beta/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  final _userHeightInput = TextEditingController();
  String userHeight = "";

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
                  "What's Your Height?",
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
                controller: _userHeightInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Your height",
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
                          _userHeightInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text("Next page", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userHeight = _userHeightInput.text;
                  if (userHeight != "" &&
                      userHeight.length > 2 &&
                      int.parse(userHeight) > 120 &&
                      int.parse(userHeight) < 220) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeightScreen()),
                    );
                    print(userHeight);
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
