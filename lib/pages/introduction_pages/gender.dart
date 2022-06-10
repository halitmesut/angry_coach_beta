import 'package:angry_coach_beta/pages/introduction_pages/age.dart';
import 'package:angry_coach_beta/pages/introduction_pages/height.dart';
import 'package:angry_coach_beta/pages/introduction_pages/weight.dart';
import 'package:angry_coach_beta/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final _userGenderInput = TextEditingController();
  String userGender = "";

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
                  "What's Your Gender?",
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
                controller: _userGenderInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[1-2]'), allow: true)
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
                          _userGenderInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              Text(
                '1 = Female',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2 = Male',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text("Next page", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userGender = _userGenderInput.text;
                  if (userGender != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeightScreen()),
                    );
                    print(userGender);
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
