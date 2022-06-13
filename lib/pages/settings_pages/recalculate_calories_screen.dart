import 'package:angry_coach_beta/providers/user_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecalculateMyDailyCaloriesScreen extends StatefulWidget {
  const RecalculateMyDailyCaloriesScreen({Key? key}) : super(key: key);

  @override
  State<RecalculateMyDailyCaloriesScreen> createState() =>
      _RecalculateMyDailyCaloriesScreenState();
}

class _RecalculateMyDailyCaloriesScreenState
    extends State<RecalculateMyDailyCaloriesScreen> {
  final ages = [for (var i = 13; i <= 65; i++) i];
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
          "Recalculate Daily Intake ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "3400 Calories",
                style: TextStyle(fontSize: 30),
              ),
              const Text("Your Recommended Daily Intake"),
              SizedBox(height: 25),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Age",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle:
                    Text(context.watch<UserProperties>().userAge.toString()),
                isThreeLine: false,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
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
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Gender",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("Female"),
                isThreeLine: false,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: Text("Male")),
                                  TextButton(
                                      onPressed: () {}, child: Text("Female")),
                                ],
                              ),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Activity Level",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("35 years"),
                isThreeLine: false,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: Text("Male")),
                                  TextButton(
                                      onPressed: () {}, child: Text("Female")),
                                ],
                              ),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Weight",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("85 kg"),
                isThreeLine: false,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: Text("Male")),
                                  TextButton(
                                      onPressed: () {}, child: Text("Female")),
                                ],
                              ),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Height",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("185 cm"),
                isThreeLine: false,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: Text("Male")),
                                  TextButton(
                                      onPressed: () {}, child: Text("Female")),
                                ],
                              ),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Diet Goal",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("Weight gain"),
                isThreeLine: false,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: Text("Male")),
                                  TextButton(
                                      onPressed: () {}, child: Text("Female")),
                                ],
                              ),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
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
                    "Recalculate",
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
