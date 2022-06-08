import 'package:angry_coach_beta/pages/introduction_pages/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final _userAgeInput = TextEditingController();
  String userAge = "";

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
                  "What's Your Age?",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                maxLength: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: _userAgeInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Your Age",
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
                          _userAgeInput.clear();
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
                  userAge = _userAgeInput.text;
                  if (userAge != "" &&
                      _userAgeInput.text.length != 1 &&
                      int.parse(userAge) > 13) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenderScreen()),
                    );
                    print(userAge);
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
