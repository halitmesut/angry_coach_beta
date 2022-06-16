import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SigninPage({required this.onClickedSignUp});
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Angry Coach ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    textLabel: "Email",
                    textController: emailController,
                    icon: Icon(
                      Icons.person,
                    ),
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                      textController: passwordController,
                      icon: Icon(
                        Icons.lock,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: true,
                      textLabel: "Password"),
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
                      elevation: 10,
                      color: Colors.deepOrange,
                      onPressed: singIn,
                      height: 60,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                            text: "Sign Up",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.deepOrange))
                      ])),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/angrycoachh.jpg"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future singIn() async {
    showDialog(
        context: context,
        builder: (contex) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
