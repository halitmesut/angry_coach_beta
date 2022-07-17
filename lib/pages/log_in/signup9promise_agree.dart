import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/recommended_daily_intake_calculator.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class SignUp9PromiseAgree extends StatefulWidget {
  const SignUp9PromiseAgree({Key? key}) : super(key: key);

  @override
  State<SignUp9PromiseAgree> createState() => _SignUp9PromiseAgreeState();
}

class _SignUp9PromiseAgreeState extends State<SignUp9PromiseAgree> {
  var userPropertiesBox = Hive.box("userProperties");
  var userDailyValuesBox = Hive.box("userDailyValues");
  var dayTime = DateFormat('yyMMddHH').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Map allWaters = userDailyValuesBox.get("water") ?? {};

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
                "Şimdi gelelim fasülyenin faydalarına. Beni ve kendini bu değişimde yüz üstü bırakmayacağına söz veriyor musun? ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  userPropertiesBox.put("userPromise", "I Promise");
                });

                // context.read<UserProperties>().getUserPromise("I promise");
              },
              textTop: '',
              textBottom: '',
              text: "I promise",
              buttonColor: userPropertiesBox.get("userPromise") == "I Promise"
                  ? const Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                setState(() {
                  userPropertiesBox.put("userPromise", "I Do Not");
                });

                //context.read<UserProperties>().getUserPromise("I don't");
              },
              textTop: '',
              textBottom: '',
              text: "I don't",
              buttonColor: userPropertiesBox.get("userPromise") == "I Do Not"
                  ? const Color.fromARGB(255, 255, 41, 41)
                  : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            MyButton(
                onPressedFunction: () {
                  if (userPropertiesBox.get("userPromise") == "I Promise") {
                    debugPrint(userPropertiesBox.toMap().toString());

                    RecommendedDailyIntake recommendedDailyIntake =
                        RecommendedDailyIntake(
                            userGender: userPropertiesBox.get("userGender"),
                            userActivityLevel:
                                userPropertiesBox.get("userActivityLevel"),
                            userDietGoal: userPropertiesBox.get("userPurpose"),
                            userAge: userPropertiesBox.get("userAge"),
                            userHeight: userPropertiesBox.get("userHeight"),
                            userWeight: userPropertiesBox.get("userWeight"));

                    userDailyValuesBox.put(
                        "userRecommendedDailyIntake",
                        recommendedDailyIntake
                            .recommendedDailyIntakeFunction());

                    userDailyValuesBox.put('water', {dayTime: 0.0});

                    debugPrint(userDailyValuesBox
                        .get("userRecommendedDailyIntake")
                        .toStringAsFixed(0));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  } else if (userPropertiesBox.get("userPromise") ==
                      "I Do Not") {
                    Fluttertoast.showToast(
                        msg:
                            "I'm not going on this journey with people who don't make promis. Find yourself another coach. Get out and Delete My App!!!",
                        fontSize: 18,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 7);
                  } else {
                    Fluttertoast.showToast(
                        msg: "You have to make a choice !",
                        fontSize: 18,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 4);
                  }
                },
                textTop: '',
                textBottom: '',
                text: "Finish",
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
