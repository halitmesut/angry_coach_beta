import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  var dayTime = DateFormat('yyMMddHH').format(DateTime.now());
  var userDailyValuesBox = Hive.box("userDailyValues");

  @override
  Widget build(BuildContext context) {
    Map allCalories = userDailyValuesBox.get("calorie") ?? {};
    Map allProteins = userDailyValuesBox.get("protein") ?? {};
    Map allCarbohydrates = userDailyValuesBox.get("carbohydrate") ?? {};
    Map allFats = userDailyValuesBox.get("fat") ?? {};
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 30,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Hedef",
                          style: TextStyle(color: Colors.black),
                        ),
                        ValueListenableBuilder(
                          valueListenable:
                              Hive.box("userDailyValues").listenable(),
                          builder: (context, Box box, _) {
                            if (box.get('userRecommendedDailyIntake') == null) {
                              box.put('userRecommendedDailyIntake', 6666);
                              return Text(
                                  box
                                      .get("userRecommendedDailyIntake")
                                      .toStringAsFixed(0),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 28));
                            } else {
                              return Text(
                                  box
                                      .get("userRecommendedDailyIntake")
                                      .toStringAsFixed(0),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 28));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box("userDailyValues").listenable(),
                      builder: (context, Box box, _) {
                        if (box.get("calorie") == null ||
                            box.get('calorie')[dayTime] == null) {
                          return CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 22,
                            progressColor: Colors.deepOrangeAccent,
                            backgroundColor:
                                const Color.fromARGB(69, 255, 158, 128),
                            circularStrokeCap: CircularStrokeCap.butt,
                            percent: 0.01,
                            center: const Text(
                              '%0',
                              style: TextStyle(fontSize: 40),
                            ),
                          );
                        } else if ((box.get("calorie")[dayTime] /
                                box.get("userRecommendedDailyIntake")) <
                            1) {
                          return CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 22,
                            progressColor: Colors.deepOrangeAccent,
                            backgroundColor:
                                const Color.fromARGB(69, 255, 158, 128),
                            circularStrokeCap: CircularStrokeCap.round,
                            percent: (box.get("calorie")[dayTime] /
                                box.get("userRecommendedDailyIntake")),
                            center: Text(
                              "${((box.get("calorie")[dayTime] / box.get("userRecommendedDailyIntake")) * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(fontSize: 40),
                            ),
                          );
                        } else if ((box.get("calorie")[dayTime] /
                                box.get("userRecommendedDailyIntake")) >
                            1) {
                          double result = box.get("calorie")[dayTime] /
                              box.get("userRecommendedDailyIntake");

                          int tour = result.toInt();
                          double afterDot = result - tour;

                          return CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 22,
                            progressColor: Colors.deepOrangeAccent,
                            backgroundColor:
                                const Color.fromARGB(255, 254, 176, 176),
                            circularStrokeCap: CircularStrokeCap.round,
                            percent: afterDot,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('overlow $tour time'),
                                Text(
                                  "${(afterDot * 100).toStringAsFixed(0)}%",
                                  style: const TextStyle(fontSize: 40),
                                ),
                                const Text(''),
                              ],
                            ),
                          );
                        } else {
                          return const Text('fsfs');
                        }
                      },
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Kalan",
                        style: TextStyle(color: Colors.black),
                      ),
                      ValueListenableBuilder(
                        valueListenable:
                            Hive.box("userDailyValues").listenable(),
                        builder: (context, Box box, _) {
                          if (allCalories.containsKey(dayTime)) {
                            String calculation =
                                (box.get("userRecommendedDailyIntake") -
                                        allCalories[dayTime])
                                    .toStringAsFixed(0);
                            return Text(calculation,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 28));
                          } else {
                            allCalories[dayTime] = 0.0;
                            userDailyValuesBox.put("calorie", allCalories);
                            String calculation =
                                (box.get("userRecommendedDailyIntake") -
                                        allCalories[dayTime])
                                    .toStringAsFixed(0);
                            return Text(calculation,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 28));
                          }
                        },
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    const Text(
                      "Alınan",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ValueListenableBuilder(
                      valueListenable: Hive.box("userDailyValues").listenable(),
                      builder: (context, Box box, _) {
                        if (box.get('calorie') == null) {
                          allCalories[dayTime] = 0.0;
                          box.put('calorie', allCalories);
                          return Text(allCalories[dayTime].toStringAsFixed(0),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else if (box.get('calorie')[dayTime] == null) {
                          allCalories[dayTime] = 0.0;
                          box.put('calorie', allCalories);
                          return Text(allCalories[dayTime].toStringAsFixed(0),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else if (box.get('calorie')[dayTime] != null) {
                          return Text(
                              box.get("calorie")[dayTime].toStringAsFixed(0),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 28));
                        } else {
                          return const Text('error ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 28));
                        }
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "kcal",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Prot'),
                          ValueListenableBuilder(
                            valueListenable:
                                Hive.box("userDailyValues").listenable(),
                            builder: (context, Box box, _) {
                              if (box.get('protein') == null) {
                                allProteins[dayTime] = 0.0;
                                box.put('protein', allProteins);
                                return Text(
                                    allProteins[dayTime].toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 22));
                              } else if (box.get('protein')[dayTime] == null) {
                                allProteins[dayTime] = 0.0;
                                box.put('protein', allProteins);
                                return Text(
                                    allProteins[dayTime].toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 22));
                              } else if (box.get('protein')[dayTime] != null) {
                                return Text(
                                    box
                                        .get("protein")[dayTime]
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 28));
                              } else {
                                return const Text('error ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 28));
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Carbs'),
                          ValueListenableBuilder(
                            valueListenable:
                                Hive.box("userDailyValues").listenable(),
                            builder: (context, Box box, _) {
                              if (box.get('carbohydrate') == null) {
                                allCarbohydrates[dayTime] = 0.0;
                                box.put('carbohydrate', allCarbohydrates);
                                return Text(
                                    allCarbohydrates[dayTime]
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 22));
                              } else if (box.get('carbohydrate')[dayTime] ==
                                  null) {
                                allCarbohydrates[dayTime] = 0.0;
                                box.put('carbohydrate', allCarbohydrates);
                                return Text(
                                    allCarbohydrates[dayTime]
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 22));
                              } else if (box.get('carbohydrate')[dayTime] !=
                                  null) {
                                return Text(
                                    box
                                        .get("carbohydrate")[dayTime]
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 28));
                              } else {
                                return const Text('error ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 28));
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Fat'),
                          ValueListenableBuilder(
                            valueListenable:
                                Hive.box("userDailyValues").listenable(),
                            builder: (context, Box box, _) {
                              if (box.get('fat') == null) {
                                allFats[dayTime] = 0.0;
                                box.put('fat', allFats);
                                return Text(allFats[dayTime].toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 22));
                              } else if (box.get('fat')[dayTime] == null) {
                                allFats[dayTime] = 0.0;
                                box.put('fat', allFats);
                                return Text(allFats[dayTime].toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 22));
                              } else if (box.get('fat')[dayTime] != null) {
                                return Text(
                                    box.get("fat")[dayTime].toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 28));
                              } else {
                                return const Text('error ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 28));
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, const Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "Weight Change History",
                    iconData: Icons.soup_kitchen_outlined,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 30,
                    topRightCornerRadius: 30,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, const Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "calorie intake history",
                    iconData: Icons.call_merge,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, const Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "BMI History",
                    iconData: Icons.call_split,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 30,
                    bottomRightCornerRadius: 30),
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }

  Future<dynamic> containersChild(
      BuildContext context, Widget containersChild) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                child: containersChild,
              ),
            ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ));
  }
}
