import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup8activity.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class SignUp7TargetWeight extends StatefulWidget {
  const SignUp7TargetWeight({Key? key}) : super(key: key);

  @override
  State<SignUp7TargetWeight> createState() => _SignUp7TargetWeightState();
}

class _SignUp7TargetWeightState extends State<SignUp7TargetWeight> {
  @override
  Widget build(BuildContext context) {
    final targetWeight = [for (var i = 40; i <= 180; i++) i];
    var box = Hive.box("userProperties");

    final userTargetWeightInput = TextEditingController();
    String userTargetWeight = "ghg";

    return Scaffold(
      extendBodyBehindAppBar: true,
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "ben hedeflediğim kiloya çok yakınım. 125 benim hedefim.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onPressedFunction: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                              child: CupertinoPicker(
                            itemExtent: 64,
                            children: targetWeight
                                .map((item) => Center(
                                      child: Text(
                                        item.toString(),
                                        style: TextStyle(fontSize: 32),
                                      ),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                box.put(
                                    "userTargetWeight", targetWeight[index]);
                              });
                              // context
                              //     .read<UserProperties>()
                              //     .getUserTargetWeight(targetWeight[index]);
                            },
                          )),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
                text: box.get("userTargetWeight").toString(),
                buttonColor: Colors.white),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
            ),
            MyButton(
                onPressedFunction: () {
                  if (box.get("userTargetWeight") != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp8Activity()),
                    );
                    debugPrint(box.toMap().toString());

                    // print(Provider.of<UserProperties>(context, listen: false)
                    //     .userTargetWeight);
                  } else {
                    Fluttertoast.showToast(
                        msg: "You must enter your target weight.",
                        fontSize: 18,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 2);
                  }
                },
                text: "Keep meeting",
                buttonColor: Colors.deepOrange),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
