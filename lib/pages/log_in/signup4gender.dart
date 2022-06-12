import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup5height.dart';
import 'package:flutter/material.dart';

class SignUp4Gender extends StatelessWidget {
  const SignUp4Gender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int gender = 4;
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
                  "Ben pazuları çok geniş, omuzları tünele sığmayan bir errrkeğimmm. sen?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () {
                    gender = 1;
                    print(gender);
                  },
                  child: Text("kadın")),
              TextButton(
                  onPressed: () {
                    gender = 2;
                    print(gender);
                  },
                  child: Text("erkek")),
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
                    if (gender == 1 || gender == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp5Height()),
                      );
                      print(gender);
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
