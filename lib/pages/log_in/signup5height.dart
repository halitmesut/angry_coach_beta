import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup6weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp5Height extends StatefulWidget {
  const SignUp5Height({Key? key}) : super(key: key);

  @override
  State<SignUp5Height> createState() => _SignUp5HeightState();
}

class _SignUp5HeightState extends State<SignUp5Height> {
  @override
  Widget build(BuildContext context) {
    final height = [for (var i = 120; i <= 220; i++) i];
    var box = Hive.box("userProperties");

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
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "What's your height(cm)? This information is necessary to calculate your perfect body shape.",
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
                            children: height
                                .map((item) => Center(
                                      child: Text(
                                        item.toString(),
                                        style: const TextStyle(fontSize: 32),
                                      ),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                box.put("userHeight", height[index]);
                              });
                            },
                          )),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
                textTop: '',
                textBottom: '',
                text: box.get("userHeight").toString() == "null"
                    ? 'Your Height'
                    : box.get("userHeight").toString(),
                buttonColor: Colors.white),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
            ),
            MyButton(
                onPressedFunction: () {
                  if (box.get("userHeight") != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp6Weight()),
                    );
                    debugPrint(box.toMap().toString());
                  } else {
                    Fluttertoast.showToast(
                        msg: "You must enter your height.",
                        fontSize: 18,
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 2);
                  }
                },
                textTop: '',
                textBottom: '',
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
