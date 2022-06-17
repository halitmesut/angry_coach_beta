import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Welcome",
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
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              MyTextField(
                textLabel: "Email",
                textController: emailController,
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
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
                    color: Colors.black,
                  ),
                  textInputType: TextInputType.number,
                  obscureText: true,
                  textLabel: "Password"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              MyButton(
                onPressedFunction: singIn,
                text: "Sign In",
                buttonColor: Colors.deepOrange,
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
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.black))
                  ])),
            ],
          ),
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
      print(e.message);
      Fluttertoast.showToast(
          msg: e.message!,
          fontSize: 18,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          timeInSecForIosWeb: 2);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
