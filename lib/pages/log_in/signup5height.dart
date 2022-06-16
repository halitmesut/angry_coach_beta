import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup6weight.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUp5Height extends StatefulWidget {
  const SignUp5Height({Key? key}) : super(key: key);

  @override
  State<SignUp5Height> createState() => _SignUp5HeightState();
}

class _SignUp5HeightState extends State<SignUp5Height> {
  @override
  Widget build(BuildContext context) {
    final height = [for (var i = 120; i <= 220; i++) i];

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
                "kapılardan geçemediğim doğrudur. hem enlemesine hem boylamasına  hahahah)",
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
                                        style: TextStyle(fontSize: 32),
                                      ),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (index) {
                              context
                                  .read<UserProperties>()
                                  .getUserHeight(height[index]);
                            },
                          )),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
                text: context.watch<UserProperties>().userHeight.toString(),
                buttonColor: Colors.white),
            SizedBox(
              height: 25,
            ),
            MyButton(
                onPressedFunction: () {
                  if (Provider.of<UserProperties>(context, listen: false)
                          .userHeight !=
                      0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp6Weight()),
                    );
                  }
                },
                text: "Keep meeting",
                buttonColor: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
