import 'package:angry_coach_beta/extract/recommended_daily_intake_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecalculateMyDailyCaloriesScreen extends StatefulWidget {
  const RecalculateMyDailyCaloriesScreen({Key? key}) : super(key: key);

  @override
  State<RecalculateMyDailyCaloriesScreen> createState() =>
      _RecalculateMyDailyCaloriesScreenState();
}

class _RecalculateMyDailyCaloriesScreenState
    extends State<RecalculateMyDailyCaloriesScreen> {
  final ages = [for (var i = 13; i <= 65; i++) i];
  final height = [for (var i = 120; i <= 220; i++) i];
  final weight = [for (var i = 40; i <= 180; i++) i];
  final gender = ["Male", "Female"];
  final dietGoal = [
    "Weight loss",
    "Slow weight loss",
    "Maintain my current weight",
    "Slow weight gain",
    "Weight gain",
  ];
  final activityLevel = [
    "Very Low Active",
    "Low Active",
    "Active",
    "Very Active",
    "Very High Active"
  ];
  var userPropertiesBox = Hive.box("userProperties");
  var userDailyValuesBox = Hive.box("userDailyValues");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Recalculate Daily Intake ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                userPropertiesBox
                    .get("userReccommendedDailyIntake")
                    .toStringAsFixed(0),
                style: const TextStyle(fontSize: 30),
              ),
              const Text("Your Recommended Daily Intake"),
              const SizedBox(height: 20),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: const Text(
                  "Age",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(userPropertiesBox.get("userAge").toString()),
                //Text(context.watch<UserProperties>().userAge.toString()),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
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
                                        style: const TextStyle(fontSize: 32),
                                      ),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                userPropertiesBox.put("userAge", ages[index]);
                              });
                              // context
                              //     .read<UserProperties>()
                              //     .getUserAge(ages[index]);
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
                title: const Text(
                  "Height",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle:
                    Text("${userPropertiesBox.get("userHeight").toString()}cm"),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  userPropertiesBox.put(
                                      "userHeight", height[index]);
                                });
                                // context
                                //     .read<UserProperties>()
                                //     .getUserHeight(height[index]);
                              },
                              children: height
                                  .map((item) => Center(
                                        child: Text(
                                          item.toString(),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ))
                                  .toList(),
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
                title: const Text(
                  "Weight",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle:
                    Text("${userPropertiesBox.get("userWeight").toString()}cm"),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  userPropertiesBox.put(
                                      "userWeight", weight[index]);
                                });

                                // context
                                //     .read<UserProperties>()
                                //     .getUserWeight(weight[index]);
                              },
                              children: weight
                                  .map((item) => Center(
                                        child: Text(
                                          item.toString(),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ))
                                  .toList(),
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
                title: const Text(
                  "Gender",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(userPropertiesBox.get("userGender").toString()),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  userPropertiesBox.put(
                                      "userGender", gender[index]);
                                });
                                // context
                                //     .read<UserProperties>()
                                //     .getUserGender(gender[index]);
                              },
                              children: gender
                                  .map((item) => Center(
                                        child: Text(
                                          item,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ))
                                  .toList(),
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
                title: const Text(
                  "Diet Goal",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(userPropertiesBox.get("userPurpose").toString()),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  userPropertiesBox.put(
                                      "userPurpose", dietGoal[index]);
                                });
                                // context
                                //     .read<UserProperties>()
                                //     .getUserDietGoal(dietGoal[index]);
                              },
                              children: dietGoal
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList(),
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
                title: const Text(
                  "Activity Level",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle:
                    Text(userPropertiesBox.get("userActivityLevel").toString()),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                          child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  userPropertiesBox.put("userActivityLevel",
                                      activityLevel[index]);
                                });
                                // context
                                //     .read<UserProperties>()
                                //     .getUserActivityLevel(activityLevel[index]);
                              },
                              children: activityLevel
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList())),
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
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border(
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
                    setState(() {
                      RecommendedDailyIntake recommendedDailyIntake =
                          RecommendedDailyIntake(
                              userGender: userPropertiesBox.get("userGender"),
                              userActivityLevel:
                                  userPropertiesBox.get("userActivityLevel"),
                              userDietGoal:
                                  userPropertiesBox.get("userPurpose"),
                              userAge: userPropertiesBox.get("userAge"),
                              userHeight: userPropertiesBox.get("userHeight"),
                              userWeight: userPropertiesBox.get("userWeight"));
                      userDailyValuesBox.put(
                          "userRecommendedDailyIntake",
                          recommendedDailyIntake
                              .recommendedDailyIntakeFunction());
                    });
                    debugPrint(
                        userDailyValuesBox.get("userRecommendedDailyIntake"));
                  },
                  height: 60,
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: Text(
                    "Recalculate",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 22),
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
