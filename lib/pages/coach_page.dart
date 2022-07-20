import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:angry_coach_beta/pages/coach_pages/speech_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class CoachPage extends StatefulWidget {
  const CoachPage({Key? key}) : super(key: key);

  @override
  State<CoachPage> createState() => _CoachPageState();
}

class _CoachPageState extends State<CoachPage> {
  var userPropertiesBox = Hive.box("userProperties");

  var userDailyValuesBox = Hive.box("userDailyValues");

  var dayTime = DateFormat('yyMMddHH').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
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
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2, child: Image.asset('assets/angrycoachh.jpg')),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Expanded(
              flex: 40,
              child: GestureDetector(
                onTap: () {
                  bottomSheetText(context,
                      "Aşağıdaki 5 maddeyi tamamlamazsan kızarım. Tamamlarsan dünyanın en mutlu koçuna dönüşürüm. Bundan çok değil 1 ay sonra ise aynaya baktığında sen dünyanın en mutlu çekirgesi olursun. Anlaşıldı mı çekirge. Görevlerini yap ikimiz de başaralım.");
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box("userDailyValues").listenable(),
                      builder: (context, Box box, _) {
                        if (box.get('water') == null) {
                          if (box.get('calorie') == null) {
                            return const Text('water null calorie null');
                          } else if (box.get('calorie') != null) {
                            return const Text('water null calorie not null');
                          } else {
                            return const Text('1-1 else shown');
                          }
                        } else if (box.get('water') != null) {
                          if (box.get('calorie') == null) {
                            return const Text('water not null calorie nulllll');
                          } else if (box.get('calorie') != null) {
                            // return Text('fsjf');

                            if (box.get('water')[dayTime] == null) {
                              if (box.get('calorie')[dayTime] == null) {
                                return const Text(
                                    'water dayTime null calorie dayTime null');
                              } else if (box.get('calorie')[dayTime] != null) {
                                return const Text(
                                    'water dayTime null calorie dayTime not null');
                              } else {
                                return const Text('1-1 else shown');
                              }
                            } else if (box.get('water')[dayTime] != null) {
                              if (box.get('calori')[dayTime] == null) {
                                return const Text(
                                    'water dayTime not null calorie dayTime null');
                              } else if (box.get('calorie')[dayTime] != null) {
                                return const Text('fsjf');
                              } else {
                                return const Text('water dayTime null else ');
                              }
                            } else {
                              return const Text('secondie first else shown');
                            }
                          } else {
                            return const Text('water null else ');
                          }
                        } else {
                          return const Text('first else shown');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetText(context,
                      "I want you to tell me even the chickpeas you ate during the day. If you eat something and don't tell me, I get angry. If you tell me, we will continue on our way with a proper program, and we will amaze those who see us.");
                },
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("userDailyValues").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get("calorie") == null ||
                        box.get("calorie")[dayTime] == null) {
                      return NormalListItem(
                        textInput: "Nutrient Input 1",
                        iconData: Icons.close,
                        iconColors: Colors.red,
                        topLeftCornerRadius: 30,
                        topRightCornerRadius: 30,
                        bottomLeftCornerRadius: 0,
                        bottomRightCornerRadius: 0,
                      );
                    } else if (box.get("calorie")[dayTime] > 0) {
                      return NormalListItem(
                        textInput: "Nutrient Input",
                        iconData: Icons.check,
                        iconColors: Colors.green,
                        topLeftCornerRadius: 30,
                        topRightCornerRadius: 30,
                        bottomLeftCornerRadius: 0,
                        bottomRightCornerRadius: 0,
                      );
                    } else {
                      return NormalListItem(
                        textInput: "Nutrient Input",
                        iconData: Icons.close,
                        iconColors: Colors.red,
                        topLeftCornerRadius: 30,
                        topRightCornerRadius: 30,
                        bottomLeftCornerRadius: 0,
                        bottomRightCornerRadius: 0,
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetText(
                      context,
                      "I gave you such a good calorie calculation that you have to follow it exactly. Neither too much nor too little. Suits you perfectly. According to this calculation, you need to takr ${(Hive.box("userDailyValues").get("userRecommendedDailyIntake")).toStringAsFixed(0)} kcal per day. You consumed ${userDailyValuesBox.get("calorie") == null ? 0 : userDailyValuesBox.get("calorie")[dayTime] == null ? 0 : userDailyValuesBox.get("calorie")[dayTime].toStringAsFixed(0)} kcal. But I can ignore a 10 percent deviation for you. ");
                },
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("userDailyValues").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get("calorie") == null ||
                        box.get("calorie")[dayTime] == null) {
                      return NormalListItem(
                        textInput: "Calorie Goal 1",
                        iconData: Icons.close,
                        iconColors: Colors.red,
                        topLeftCornerRadius: 0,
                        topRightCornerRadius: 0,
                        bottomLeftCornerRadius: 0,
                        bottomRightCornerRadius: 0,
                      );
                    } else if (box.get("calorie")[dayTime] /
                                box.get("userRecommendedDailyIntake") >
                            0.9 &&
                        box.get("calorie")[dayTime] /
                                box.get("userRecommendedDailyIntake") <
                            1.1) {
                      return NormalListItem(
                        textInput: "Calorie Goal",
                        iconData: Icons.check,
                        iconColors: Colors.green,
                        topLeftCornerRadius: 0,
                        topRightCornerRadius: 0,
                        bottomLeftCornerRadius: 0,
                        bottomRightCornerRadius: 0,
                      );
                    } else {
                      return NormalListItem(
                        textInput: "Calorie Goal",
                        iconData: Icons.close,
                        iconColors: Colors.red,
                        topLeftCornerRadius: 0,
                        topRightCornerRadius: 0,
                        bottomLeftCornerRadius: 0,
                        bottomRightCornerRadius: 0,
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: () {
                    bottomSheetText(context,
                        "A healthy adult should drink approximately 35 ml of water per kilogram of weight per day. According to this calculation, you need to drink ${(Hive.box("userProperties").get("userWeight") * 0.035).toStringAsFixed(1)} liters of water per day. You consumed ${userDailyValuesBox.get("water")[dayTime] != null ? userDailyValuesBox.get("water")[dayTime].toStringAsFixed(1) : 0} liter of water today.");
                  },
                  child: ValueListenableBuilder(
                    // userDailyValuesBox.get("water")[dayTime] != null ? userDailyValuesBox.get("water")[dayTime].toStringAsFixed(1) : 0
                    valueListenable: Hive.box("userDailyValues").listenable(),
                    builder: (context, Box box, _) {
                      if (box.get("water") == null ||
                          box.get("water")[dayTime] == null) {
                        return NormalListItem(
                          textInput: "Water Consumption1",
                          iconData: Icons.close,
                          iconColors: Colors.red,
                          topLeftCornerRadius: 0,
                          topRightCornerRadius: 0,
                          bottomLeftCornerRadius: 30,
                          bottomRightCornerRadius: 30,
                        );
                      } else if (box.get("water")[dayTime] >
                          userPropertiesBox.get("userWeight") * 0.035 * 0.9) {
                        return NormalListItem(
                          textInput: "Water Consumption3",
                          iconData: Icons.check,
                          iconColors: Colors.green,
                          topLeftCornerRadius: 0,
                          topRightCornerRadius: 0,
                          bottomLeftCornerRadius: 30,
                          bottomRightCornerRadius: 30,
                        );
                      } else {
                        return NormalListItem(
                          textInput: "Water Consumption4",
                          iconData: Icons.close,
                          iconColors: Colors.red,
                          topLeftCornerRadius: 0,
                          topRightCornerRadius: 0,
                          bottomLeftCornerRadius: 30,
                          bottomRightCornerRadius: 30,
                        );
                      }
                    },
                  ),
                )),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetText(BuildContext context, String text) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ));
  }
}
