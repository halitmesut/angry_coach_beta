import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup9speed_of_change_weight.dart';
import 'package:flutter/material.dart';

class SignUp8Activity extends StatelessWidget {
  const SignUp8Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int activityLevel = 0;
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
                  "ben çok hareketliyim. hergün 5 saat antrenman yapıyorum.senin akttivite düzeyin ney?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () {
                    activityLevel = 1;
                    print(activityLevel);
                  },
                  child: Text("pek hareketli değil")),
              TextButton(
                  onPressed: () {
                    activityLevel = 2;
                    print(activityLevel);
                  },
                  child: Text("az hareketli")),
              TextButton(
                  onPressed: () {
                    activityLevel = 3;
                    print(activityLevel);
                  },
                  child: Text("hareketli")),
              TextButton(
                  onPressed: () {
                    activityLevel = 4;
                    print(activityLevel);
                  },
                  child: Text("cok hareketli")),
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
                    if (activityLevel == 1 ||
                        activityLevel == 2 ||
                        activityLevel == 3 ||
                        activityLevel == 4) {
                      print(activityLevel);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SignUp9SpeedOfChangeWeight()),
                      );
                      print(activityLevel);
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
