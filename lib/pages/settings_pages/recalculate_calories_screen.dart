import 'package:angry_coach_beta/extract/recommended_daily_intake_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  var box = Hive.box("userProperties");

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
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                box.get("userReccommendedDailyIntake").toString(),
                style: TextStyle(fontSize: 30),
              ),
              const Text("Your Recommended Daily Intake"),
              SizedBox(height: 20),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Age",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(box.get("userAge").toString()),
                //Text(context.watch<UserProperties>().userAge.toString()),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
                              setState(() {
                                box.put("userAge", ages[index]);
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
                title: Text(
                  "Height",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("${box.get("userHeight").toString()}cm"),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  box.put("userHeight", height[index]);
                                });
                                // context
                                //     .read<UserProperties>()
                                //     .getUserHeight(height[index]);
                              },
                              children: height
                                  .map((item) => Center(
                                        child: Text(
                                          item.toString(),
                                          style: TextStyle(fontSize: 20),
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
                title: Text(
                  "Weight",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("${box.get("userWeight").toString()}cm"),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  box.put("userWeight", weight[index]);
                                });

                                // context
                                //     .read<UserProperties>()
                                //     .getUserWeight(weight[index]);
                              },
                              children: weight
                                  .map((item) => Center(
                                        child: Text(
                                          item.toString(),
                                          style: TextStyle(fontSize: 20),
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
                title: Text(
                  "Gender",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(box.get("userGender").toString()),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  box.put("userGender", gender[index]);
                                });
                                // context
                                //     .read<UserProperties>()
                                //     .getUserGender(gender[index]);
                              },
                              children: gender
                                  .map((item) => Center(
                                        child: Text(
                                          item,
                                          style: TextStyle(fontSize: 20),
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
                title: Text(
                  "Diet Goal",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(box.get("userPurpose").toString()),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  box.put("userPurpose", dietGoal[index]);
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
                                        style: TextStyle(fontSize: 20),
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
                title: Text(
                  "Activity Level",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(box.get("userActivityLevel").toString()),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  box.put("userActivityLevel",
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
                                        style: TextStyle(fontSize: 20),
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
              Expanded(
                child: SizedBox(),
              ),
              Container(
                padding: EdgeInsets.only(top: 2, left: 2),
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
                              userGender: box.get("userGender"),
                              userActivityLevel: box.get("userActivityLevel"),
                              userDietGoal: box.get("userPurpose"),
                              userAge: box.get("userAge"),
                              userHeight: box.get("userHeight"),
                              userWeight: box.get("userWeight"));
                      box.put(
                          "userReccommendedDailyIntake",
                          recommendedDailyIntake
                              .recommendedDailyIntakeFunction());
                    });
                    debugPrint(box.get("userReccommendedDailyIntake"));
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
