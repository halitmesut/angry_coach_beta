import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/main.dart';
import 'package:angry_coach_beta/pages/log_in/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  // ignore: use_key_in_widget_constructors
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Welcome",
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
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                textLabel: "Email",
                textController: emailController,
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                textInputType: TextInputType.emailAddress,
                obscureText: false,
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
                  textLabel: "Password"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              MyButton(
                onPressedFunction: singIn,
                text: "Sign In",
                buttonColor: Colors.deepOrange,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: "Sign Up",
                        style: const TextStyle(
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
        builder: (contex) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
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
