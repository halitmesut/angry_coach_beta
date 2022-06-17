import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/log_in/signup.dart';
import 'package:angry_coach_beta/pages/log_in/signup7targe_weight.dart';
import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUp6Weight extends StatefulWidget {
  const SignUp6Weight({Key? key}) : super(key: key);

  @override
  State<SignUp6Weight> createState() => _SignUp6WeightState();
}

class _SignUp6WeightState extends State<SignUp6Weight> {
  @override
  Widget build(BuildContext context) {
    final weight = [for (var i = 40; i <= 180; i++) i];

    final userWeightInput = TextEditingController();
    String userWeight = "ghg";

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
            const Text("benim kilom 122. ama almam gereken 2 kilo daha ver. )",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
                onPressedFunction: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                              child: CupertinoPicker(
                            itemExtent: 64,
                            children: weight
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
                                  .getUserWeight(weight[index]);
                            },
                          )),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
                text: context.watch<UserProperties>().userWeight.toString(),
                buttonColor: Colors.white),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
            ),
            MyButton(
                onPressedFunction: () {
                  if (Provider.of<UserProperties>(context, listen: false)
                          .userWeight !=
                      0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp7TargetWeight()),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "You must enter your weight.",
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
