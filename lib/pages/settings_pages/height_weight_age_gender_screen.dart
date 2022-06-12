import 'package:flutter/material.dart';

class HeightWeightAgeAndGenderScreen extends StatefulWidget {
  const HeightWeightAgeAndGenderScreen({Key? key}) : super(key: key);

  @override
  State<HeightWeightAgeAndGenderScreen> createState() =>
      _HeightWeightAgeAndGenderScreenState();
}

class _HeightWeightAgeAndGenderScreenState
    extends State<HeightWeightAgeAndGenderScreen> {
  @override
  Widget build(BuildContext context) {
    String userGender = "x";
    String userAge = "x";
    String userHeight = "x";
    String userWeight = "x";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "User Dimentions ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              TextButton(
                  child: Text("Female"),
                  onPressed: () {
                    userGender = "Female";
                    print(userGender);
                  }),
              TextButton(
                  child: Text("35 years"),
                  onPressed: () {
                    userAge = "35";
                    print(userAge);
                  }),
              TextButton(
                  child: Text("78 kilos"),
                  onPressed: () {
                    userHeight = "kilo";
                    print(userHeight);
                  }),
              TextButton(
                  child: Text("170 cm"),
                  onPressed: () {
                    userWeight = "170";
                    print(userWeight);
                  }),
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
                    if (userHeight != "x" &&
                        userWeight != "x" &&
                        userAge != "x" &&
                        userGender != "x") {
                      print(userHeight);
                      print(userWeight);
                      print(userAge);
                      print(userGender);
                    }
                  },
                  height: 60,
                  child: Text(
                    "Set",
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
