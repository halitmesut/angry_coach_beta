import 'package:angry_coach_beta/pages/introduction_pages/age.dart';
import 'package:angry_coach_beta/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({Key? key}) : super(key: key);

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  final _userPurposeInput = TextEditingController();
  String userPurpose = "";

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
                  "What's Your Purpose?",
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
                controller: _userPurposeInput,
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
                          _userPurposeInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              Text(
                '1 = Lose weight',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2 = stabil weight',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '3 = gain weight',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text("Next page", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userPurpose = _userPurposeInput.text;
                  if (userPurpose != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgeScreen()),
                    );
                    print(userPurpose);
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
