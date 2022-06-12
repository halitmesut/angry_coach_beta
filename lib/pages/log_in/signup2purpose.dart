import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup3age.dart';
import 'package:flutter/material.dart';

class SignUp2Purpose extends StatefulWidget {
  const SignUp2Purpose({Key? key}) : super(key: key);

  @override
  State<SignUp2Purpose> createState() => _SignUp2PurposeState();
}

class _SignUp2PurposeState extends State<SignUp2Purpose> {
  int purpose = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Angry Coach",
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
              const SizedBox(
                height: 25,
              ),
              const Text(
                  "Benim amacım Çekirgelerime istedikler hedefe ulaşana kadar destek olmak. Peki senin hedefin ne?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () {
                    purpose = 1;
                    print(purpose);
                  },
                  child: Text("kilo vermek")),
              TextButton(
                  onPressed: () {
                    purpose = 2;
                    print(purpose);
                  },
                  child: Text("aynı kiloda kalmak")),
              TextButton(
                  onPressed: () {
                    purpose = 3;
                    print(purpose);
                  },
                  child: Text("kilo almak")),
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
                    if (purpose == 1 || purpose == 2 || purpose == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp3Age()),
                      );
                      print(purpose);
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
            ],
          ),
        ),
      ),
    );
  }
}
