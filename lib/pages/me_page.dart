import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  var userPropertiesBox = Hive.box("userProperties");
  var userDailyValuesBox = Hive.box("userDailyValues");

  @override
  Widget build(BuildContext context) {
    var dayTime = userDailyValuesBox.get('dayTime');
    var allWeights = userDailyValuesBox.get("weight");

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
                    child: GestureDetector(
                      onTap: () {
                        bottomSheetContainer(context, const Text("holaaaaaa"));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            "Mağaza",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Image.asset('assets/fatgirl.png')),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bottomSheetContainer(context, const Text("holaaaaaa"));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.face_retouching_natural,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            "Kuaför",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 20,
              child: GestureDetector(
                onTap: () {
                  double sliderAmount =
                      userDailyValuesBox.get('weight').last['weight'];
                  // double sliderAmount = userPropertiesBox.get('weight');
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  StatefulBuilder(
                                    builder: (context, state) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              const SizedBox(
                                                width: 30.0,
                                              ),
                                              Text(
                                                sliderAmount.toStringAsFixed(1),
                                                style: const TextStyle(
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Text(
                                                "kg",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Slider(
                                            value: sliderAmount,
                                            min: userDailyValuesBox
                                                    .get('weight')
                                                    .last['weight'] -
                                                2.5,
                                            max: userDailyValuesBox
                                                    .get('weight')
                                                    .last['weight'] +
                                                2.5,
                                            activeColor: Colors.deepOrange,
                                            inactiveColor: const Color.fromARGB(
                                                255, 255, 193, 174),
                                            onChanged: (double newValue) {
                                              state(() {
                                                sliderAmount = newValue;
                                              });
                                              setState(() {
                                                sliderAmount = newValue;
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          MyButton(
                                            onPressedFunction: () async {
                                              debugPrint(dayTime);

                                              if (allWeights[allWeights.length -
                                                      1]['date'] ==
                                                  userDailyValuesBox
                                                      .get('dayTime')) {
                                                allWeights[
                                                    allWeights.length - 1] = {
                                                  'date': Hive.box(
                                                          "userDailyValues")
                                                      .get('dayTime'),
                                                  'weight': sliderAmount
                                                };

                                                await userDailyValuesBox.put(
                                                    "weight", allWeights);
                                              } else {
                                                allWeights.add(
                                                  {
                                                    'date': Hive.box(
                                                            "userDailyValues")
                                                        .get('dayTime'),
                                                    'weight': sliderAmount
                                                  },
                                                );
                                                await userDailyValuesBox.put(
                                                    "weight", allWeights);
                                              }

                                              Navigator.of(context).pop();
                                              debugPrint(allWeights.toString());
                                            },
                                            textTop: '',
                                            textBottom: '',
                                            text: "Save my new weight",
                                            buttonColor: Colors.deepOrange,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable:
                            Hive.box("userDailyValues").listenable(),
                        builder: (context, Box box, _) {
                          return Text(
                            box.get('weight').last['weight'].toStringAsFixed(1),
                            style: const TextStyle(fontSize: 40),
                            textAlign: TextAlign.center,
                          );
                        }),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 20,
              child: GestureDetector(
                onTap: () {
                  bottomSheetContainer(context, const Text("holaaaaaa"));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: WideListBottomItem(
                      leftTitle: "Başlangıç",
                      middleTitle: "Haftalık Hedef",
                      rightTitle: "Aylık Hedef",
                      leftInput: Hive.box("userDailyValues").get('weight')[0]
                          ['weight'],
                      middleInput: 83.5,
                      rightInput: 80.5),
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetContainer(context, const Text("holaaaaaa"));
                },
                child: NormalListItem(
                  textInput: "My Awards",
                  iconData: Icons.cruelty_free,
                  iconColors: Colors.black,
                  topLeftCornerRadius: 30,
                  topRightCornerRadius: 30,
                  bottomLeftCornerRadius: 0,
                  bottomRightCornerRadius: 0,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetContainer(context, const Text("holaaaaaa"));
                },
                child: NormalListItem(
                  textInput: "Stars I've Earned",
                  iconData: Icons.route,
                  iconColors: Colors.black,
                  topLeftCornerRadius: 0,
                  topRightCornerRadius: 0,
                  bottomLeftCornerRadius: 0,
                  bottomRightCornerRadius: 0,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetContainer(context, const Text("holaaaaaa"));
                },
                child: NormalListItem(
                  textInput: "My Diet Roadmap",
                  iconData: Icons.restaurant_menu,
                  iconColors: Colors.black,
                  topLeftCornerRadius: 0,
                  topRightCornerRadius: 0,
                  bottomLeftCornerRadius: 30,
                  bottomRightCornerRadius: 30,
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetContainer(
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
