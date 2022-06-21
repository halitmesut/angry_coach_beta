import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/pages/log_in/signup2purpose.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class SignUp1Name extends StatefulWidget {
  final VoidCallback onClickedSignIn;
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 70,
              ),
            ),
            const Text(
                "Bana AngryCoach derler. Senin adın neBana AngryCoach derler",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
                textController: nameController,
                icon: Icon(
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
                  // for (var element in box.values) {
                  //   debugPrint(element.toString());
                  // }

                  // context
                  //     .read<UserProperties>()
                  //     .getUserName(nameController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp2Purpose()),
                  );

                  // print(Provider.of<UserProperties>(context, listen: false)
                  //     .userName);
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
              text: "Keep meeting",
              buttonColor: Colors.deepOrange,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
