import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/main.dart';
import 'package:angry_coach_beta/pages/log_in/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage();
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    bool isLogin = true;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Sign Up ",
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
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create an Accound. It's Free.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 32, 32, 32),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              MyTextField(
                textController: emailController,
                icon: Icon(
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
                textLabel: "Password",
                validate: (value) => value != null && value.length < 6
                    ? "Enter min 6 characters"
                    : null,
              ),
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
                  onPressed: signUp,
                  height: 60,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/angrycoachh.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
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
    } on FirebaseAuthException catch (e) {
      print(e);

      // Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
