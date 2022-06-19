// ignore_for_file: unused_local_variable

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup5height.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUp4Gender extends StatelessWidget {
  const SignUp4Gender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int gender = 4;
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
                "Ben pazuları çok geniş, omuzları tünele sığmayan bir errrkeğimmm. sen?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                context.read<UserProperties>().getUserGender("Male");
              },
              text: "Male",
              buttonColor: context.watch<UserProperties>().userGender == "Male"
                  ? Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                context.read<UserProperties>().getUserGender("Female");
              },
              text: "Female",
              buttonColor:
                  context.watch<UserProperties>().userGender == "Female"
                      ? Color.fromARGB(255, 162, 194, 249)
                      : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            MyButton(
                onPressedFunction: () {
                  if (Provider.of<UserProperties>(context, listen: false)
                          .userGender !=
                      "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp5Height()),
                    );
                    print(Provider.of<UserProperties>(context, listen: false)
                        .userGender);
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
