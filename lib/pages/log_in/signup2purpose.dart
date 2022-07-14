// ignore_for_file: deprecated_member_use, avoid_print

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup3age.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp2Purpose extends StatefulWidget {
  const SignUp2Purpose({Key? key}) : super(key: key);

  @override
  State<SignUp2Purpose> createState() => _SignUp2PurposeState();
}

class _SignUp2PurposeState extends State<SignUp2Purpose> {
  var box = Hive.box("userProperties");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "Come on, tell me your target. I will make a great program for you.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userPurpose", "Weight loss");
                });
              },
              textTop: '',
              textBottom: '',
              text: "Weight loss",
              buttonColor: box.get("userPurpose") == "Weight loss"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userPurpose", "Slow weight loss");
                });
              },
              textTop: '',
              textBottom: '',
              text: "Slow weight loss",
              buttonColor: box.get("userPurpose") == "Slow weight loss"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userPurpose", "Maintain my current weight");
                });
              },
              textTop: '',
              textBottom: '',
              text: "Maintain my current weight",
              buttonColor:
                  box.get("userPurpose") == "Maintain my current weight"
                      ? const Color.fromARGB(255, 162, 194, 249)
                      : Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userPurpose", "Slow weight gain");
                });
              },
              textTop: '',
              textBottom: '',
              text: "Slow weight gain",
              buttonColor: box.get("userPurpose") == "Slow weight gain"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userPurpose", "Weight gain");
                });
              },
              textTop: '',
              textBottom: '',
              text: "Weight gain",
              buttonColor: box.get("userPurpose") == "Weight gain"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            MyButton(
              onPressedFunction: () {
                if (box.get("userPurpose") != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp3Age()),
                  );
                  debugPrint(box.toMap().toString());
                } else {
                  Fluttertoast.showToast(
                      msg: "You have to choose your purpose.",
                      fontSize: 18,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      timeInSecForIosWeb: 2);
                }
              },
              textTop: '',
              textBottom: '',
              text: "Keep meeting",
              buttonColor: Colors.deepOrange,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
