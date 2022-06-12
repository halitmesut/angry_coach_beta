import 'package:angry_coach_beta/pages/log_in/login.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/singup1name.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? SigninPage(onClickedSignUp: toggle)
      : SignUp1Name(
          onClickedSignIn: toggle,
        );

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
