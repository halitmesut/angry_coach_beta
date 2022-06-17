import 'dart:ffi';

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Forgot Password",
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
            const Text("Şifreni unuttuysan yenileyelim",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              textController: emailController,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              textInputType: TextInputType.name,
              obscureText: false,
              textLabel: "Name",
              validate: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? "Enter a valid Email"
                      : null,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            MyButton(
              onPressedFunction: resetPassword,
              text: "Reset Password",
              buttonColor: Colors.deepOrange,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        builder: (contex) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),

        //      password: passwordController.text.trim()
      );
      Fluttertoast.showToast(
          msg: "Password Reset Email Sent",
          fontSize: 18,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          timeInSecForIosWeb: 2);

      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Fluttertoast.showToast(
          msg: e.message!,
          fontSize: 18,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          timeInSecForIosWeb: 2);

      Navigator.of(context).pop();
    }

    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
