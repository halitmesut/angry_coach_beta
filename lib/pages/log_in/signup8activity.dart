import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup9speed_of_change_weight.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUp8Activity extends StatelessWidget {
  const SignUp8Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activityLevel = [
      "Sedentary",
      "Low active",
      "Active",
      "Very active",
    ];

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
                context
                    .read<UserProperties>()
                    .getUserActivityLevel("Pek hareketli değil");
              },
              text: "Pek hareketli değil",
              buttonColor: context.watch<UserProperties>().userActivityLevel ==
                      "Pek hareketli değil"
                  ? Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                context
                    .read<UserProperties>()
                    .getUserActivityLevel("Az hareketli");
              },
              text: "Az hareketli",
              buttonColor: context.watch<UserProperties>().userActivityLevel ==
                      "Az hareketli"
                  ? Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                context
                    .read<UserProperties>()
                    .getUserActivityLevel("Hareketli");
              },
              text: "Hareketli",
              buttonColor: context.watch<UserProperties>().userActivityLevel ==
                      "Hareketli"
                  ? Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            MyButton(
              onPressedFunction: () {
                context
                    .read<UserProperties>()
                    .getUserActivityLevel("Çok hareketli");
              },
              text: "Çok hareketli",
              buttonColor: context.watch<UserProperties>().userActivityLevel ==
                      "Çok hareketli"
                  ? Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.027,
            ),
            MyButton(
                onPressedFunction: () {
                  if (Provider.of<UserProperties>(context, listen: false)
                          .userActivityLevel !=
                      "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SignUp9SpeedOfChangeWeight()),
                    );
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
