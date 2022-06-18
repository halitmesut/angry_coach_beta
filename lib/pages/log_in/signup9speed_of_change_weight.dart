import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUp9SpeedOfChangeWeight extends StatelessWidget {
  const SignUp9SpeedOfChangeWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int speedOfChangeWeight = 4;
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
                "Şimdi gelelim fasülyenin faydalarına. Beni ve kendini bu değişimde yüz üstü bırakmayacağına söz veriyor musun? ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                context.read<UserProperties>().getUserPromise("I promise");
              },
              text: "I promise",
              buttonColor:
                  context.watch<UserProperties>().userPromise == "I promise"
                      ? Color.fromARGB(255, 162, 194, 249)
                      : Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                context.read<UserProperties>().getUserPromise("I don't");
              },
              text: "I don't",
              buttonColor:
                  context.watch<UserProperties>().userPromise == "I don't"
                      ? Color.fromARGB(255, 255, 41, 41)
                      : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            MyButton(
                onPressedFunction: () {
                  if (Provider.of<UserProperties>(context, listen: false)
                          .userPromise ==
                      "I promise") {
                    context.read<UserProperties>().getReccommendedDailyIntake();
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userName);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userDietGoal);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userAge);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userGender);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userHeight);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userWeight);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userActivityLevel);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userPromise);
                    print(Provider.of<UserProperties>(context, listen: false)
                        .recommendedDailyIntake);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            "I'm not going on this journey with people who don't make promises. Find yourself another coach. Get out and Delete My App!!!",
                        fontSize: 18,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 5);
                  }
                },
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
