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
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Bana AngryCoach derler. Senin adın ne?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[a-zA-ZŞşĞğÇçİıÖöÜü]'),
                      allow: true)
                ],
                validator: (value) => value != null && value.length < 3
                    ? "Enter min 3 characters"
                    : null,
                decoration: InputDecoration(
                  labelText: "Name",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text("${context.watch<UserProperties>().userName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  elevation: 0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    if (nameController.text.length > 2) {
                      context
                          .read<UserProperties>()
                          .getUserName(nameController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUp2Purpose()),
                      );

                      print(nameController.text);
                    }
                  },
                  height: 60,
                  child: Text(
                    "keep meeting",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
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
                            color: Colors.orange))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
