import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup3age.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUp2Purpose extends StatefulWidget {
  const SignUp2Purpose({Key? key}) : super(key: key);

  @override
  State<SignUp2Purpose> createState() => _SignUp2PurposeState();
}

class _SignUp2PurposeState extends State<SignUp2Purpose> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "Benim amacım Çekirgelerime istedikler hedefe ulaşana kadar destek olmak. Peki senin hedefin ne?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              onPressedFunction: () {
                context.read<UserProperties>().getUserDietGoal("Kilo vermek");
              },
              text: "Kilo vermek",
              buttonColor:
                  context.watch<UserProperties>().userDietGoal == "Kilo vermek"
                      ? Color.fromARGB(255, 162, 194, 249)
                      : Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                context
                    .read<UserProperties>()
                    .getUserDietGoal("Kilomu korumak");
              },
              text: "Kilomu korumak",
              buttonColor: context.watch<UserProperties>().userDietGoal ==
                      "Kilomu korumak"
                  ? Color.fromARGB(255, 162, 194, 249)
                  : Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onPressedFunction: () {
                context.read<UserProperties>().getUserDietGoal("Kilo almak");
              },
              text: "Kilo almak",
              buttonColor:
                  context.watch<UserProperties>().userDietGoal == "Kilo almak"
                      ? Color.fromARGB(255, 162, 194, 249)
                      : Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            MyButton(
              onPressedFunction: () {
                if (Provider.of<UserProperties>(context, listen: false)
                        .userDietGoal !=
                    "") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp3Age()),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "You should choose one.",
                      fontSize: 18,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      timeInSecForIosWeb: 2);
                }
              },
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
