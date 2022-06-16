import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup4gender.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp3Age extends StatefulWidget {
  const SignUp3Age({Key? key}) : super(key: key);

  @override
  State<SignUp3Age> createState() => _SignUp3AgeState();
}

class _SignUp3AgeState extends State<SignUp3Age> {
  @override
  Widget build(BuildContext context) {
    final ages = [for (var i = 13; i <= 65; i++) i];

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
                "Ben 43 yaşındayım. Ama görenler daha 30 bile gösterediğimi söylüyo.",
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
                            children: ages
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
                                  .getUserAge(ages[index]);
                            },
                          )),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
                text: context.watch<UserProperties>().userAge.toString(),
                buttonColor: Colors.white),
            SizedBox(
              height: 25,
            ),
            MyButton(
                onPressedFunction: () {
                  if (Provider.of<UserProperties>(context, listen: false)
                          .userAge !=
                      0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp4Gender()),
                    );
                  }
                },
                text: "Keep meeting",
                buttonColor: Colors.deepOrange)
          ],
        ),
      ),
    );
  }
}
