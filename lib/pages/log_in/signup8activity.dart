import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup9promise_agree.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class SignUp8Activity extends StatefulWidget {
  const SignUp8Activity({Key? key}) : super(key: key);

  @override
  State<SignUp8Activity> createState() => _SignUp8ActivityState();
}

class _SignUp8ActivityState extends State<SignUp8Activity> {
  @override
  Widget build(BuildContext context) {
    final activityLevel = [
      "Very Low Active",
      "Low Active",
      "Active",
      "Very Active",
      "Very High Active"
    ];
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
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "ben çok hareketliyim. hergün 5 saat antrenman yapıyorum.senin akttivite düzeyin ney?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userActivityLevel", "Very Low Active");
                });
                // context
                //     .read<UserProperties>()
                //     .getUserActivityLevel("Very Low Active");
              },
              text: "Very Low Active",
              buttonColor: box.get("userActivityLevel") == "Very Low Active"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userActivityLevel", "Low Active");
                });
                // context
                //     .read<UserProperties>()
                //     .getUserActivityLevel("Low Active");
              },
              text: "Low Active",
              buttonColor: box.get("userActivityLevel") == "Low Active"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userActivityLevel", "Active");
                });
                // context.read<UserProperties>().getUserActivityLevel("Active");
              },
              text: "Active",
              buttonColor: box.get("userActivityLevel") == "Active"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userActivityLevel", "Very Active");
                });
                // context
                //     .read<UserProperties>()
                //     .getUserActivityLevel("Very Active");
              },
              text: "Very Active",
              buttonColor: box.get("userActivityLevel") == "Very Active"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  box.put("userActivityLevel", "Very High Active");
                });
                // context
                //     .read<UserProperties>()
                //     .getUserActivityLevel("Very High Active");
              },
              text: "Very High Active",
              buttonColor: box.get("userActivityLevel") == "Very High Active"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            MyButton(
                onPressedFunction: () {
                  if (box.get("userActivityLevel") != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp9PromiseAgree()),
                    );
                    debugPrint(box.toMap().toString());
                  } else {
                    Fluttertoast.showToast(
                        msg: "You must select your activity level.",
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
