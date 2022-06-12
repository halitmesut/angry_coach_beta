import 'package:angry_coach_beta/pages/log_in/signup8activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp7TargetWeight extends StatefulWidget {
  const SignUp7TargetWeight({Key? key}) : super(key: key);

  @override
  State<SignUp7TargetWeight> createState() => _SignUp7TargetWeightState();
}

class _SignUp7TargetWeightState extends State<SignUp7TargetWeight> {
  @override
  Widget build(BuildContext context) {
    final userTargetWeightInput = TextEditingController();
    String userTargetWeight = "ghg";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Angry Coach",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                  "ben hedeflediğim kiloya çok yakınım. 125 benim hedefim.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 25,
              ),
              TextField(
                maxLength: 3,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: userTargetWeightInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    hintText: "hedeflediğin kilo kaç",
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
                          userTargetWeightInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  elevation: 0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    userTargetWeight = userTargetWeightInput.text;
                    if (userTargetWeight != "" &&
                        userTargetWeightInput.text.length != 1 &&
                        int.parse(userTargetWeight) > 40 &&
                        int.parse(userTargetWeight) < 180) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp8Activity()),
                      );
                      print(userTargetWeight);
                    }
                  },
                  height: 60,
                  child: Text(
                    "keep meeting",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
