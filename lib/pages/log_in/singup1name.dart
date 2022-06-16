import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/pages/log_in/signup2purpose.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUp1Name extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUp1Name({required this.onClickedSignIn});

  @override
  State<SignUp1Name> createState() => _SignUp1NameState();
}

class _SignUp1NameState extends State<SignUp1Name> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Let's meet",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bana AngryCoach derler. Senin adın ne?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
                textController: nameController,
                icon: Icon(
                  Icons.person,
                ),
                textInputType: TextInputType.name,
                obscureText: false,
                textLabel: "Name"),
            SizedBox(
              height: 70,
            ),
            MyButton(
              onPressedFunction: () {
                if (nameController.text.length > 2) {
                  context
                      .read<UserProperties>()
                      .getUserName(nameController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp2Purpose()),
                  );

                  print(nameController.text);
                }
              },
              text: "Keep meeting",
              buttonColor: Colors.deepOrange,
            ),
            RichText(
              text: TextSpan(
                text: "Have an account?",
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: "Sign In",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
