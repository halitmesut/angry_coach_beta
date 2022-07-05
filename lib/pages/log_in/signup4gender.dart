// ignore_for_file: unused_local_variable

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup5height.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp4Gender extends StatefulWidget {
  const SignUp4Gender({Key? key}) : super(key: key);

  @override
  State<SignUp4Gender> createState() => _SignUp4GenderState();
}

class _SignUp4GenderState extends State<SignUp4Gender> {
  @override
  Widget build(BuildContext context) {
    int gender = 4;
    var box = Hive.box("userProperties");
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Angry Coach",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "Ben pazuları çok geniş, omuzları tünele sığmayan bir errrkeğimmm. sen?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userGender", "Male");
                });
              },
              text: "Male",
              buttonColor: box.get("userGender") == "Male"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userGender", "Female");
                });
              },
              text: "Female",
              buttonColor: box.get("userGender") == "Female"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            MyButton(
                onPressedFunction: () {
                  if (box.get("userGender") != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp5Height()),
                    );
                    debugPrint(box.toMap().toString());
                  } else {
                    Fluttertoast.showToast(
                        msg: "You have to choose your gender.",
                        fontSize: 18,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 2);
                  }
                },
                text: "Keep meeting",
                buttonColor: Colors.deepOrange),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
