// ignore_for_file: deprecated_member_use, avoid_print

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUpPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SignUpPage();
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var box = Hive.box("userProperties");

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool isLogin = true;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Sign Up ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background3.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Create an Accound. It's Free.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 32, 32, 32),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                textController: emailController,
                icon: const Icon(
                  Icons.alternate_email,
                  color: Colors.black,
                ),
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                textLabel: "Email",
                validate: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Enter a valid Email"
                        : null,
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                textController: passwordController,
                icon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                textInputType: TextInputType.number,
                obscureText: true,
                textLabel: "Password",
                validate: (value) => value != null && value.length < 6
                    ? "Enter min 6 characters"
                    : null,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              MyButton(
                onPressedFunction: signUp,
                text: "Sign Up",
                buttonColor: Colors.deepOrange,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (contex) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      await box.put("userEmail", emailController.text);
      await box.put("userPassword", passwordController.text);
      debugPrint(box.toMap().toString());
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.message!,
          fontSize: 18,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          timeInSecForIosWeb: 5);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
