import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/pages/log_in/signup2purpose.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp1Name extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  // ignore: use_key_in_widget_constructors
  const SignUp1Name({required this.onClickedSignIn});

  @override
  State<SignUp1Name> createState() => _SignUp1NameState();
}

class _SignUp1NameState extends State<SignUp1Name> {
  final nameController = TextEditingController();
  var box = Hive.box("userProperties");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Let's meet",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        // ignore: deprecated_member_use
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
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            const Text("Hi buddy. I'm AngryCoach. What is your name?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
                textController: nameController,
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                textInputType: TextInputType.name,
                obscureText: false,
                textLabel: "Name"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            MyButton(
              onPressedFunction: () async {
                if (nameController.text.length > 2) {
                  await box.clear();

                  await box.put("userName", nameController.text);

                  debugPrint(box.toMap().toString());

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUp2Purpose()),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "Your name must be at least 3 letters.",
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
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: "Have an account?",
                style: const TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: "Sign In",
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
