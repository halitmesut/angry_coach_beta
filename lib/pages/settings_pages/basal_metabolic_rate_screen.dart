import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/constants_aditional_apps.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/widgets_atitional_apps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasalMetabolicRateScreen extends StatefulWidget {
  const BasalMetabolicRateScreen({Key? key}) : super(key: key);

  @override
  State<BasalMetabolicRateScreen> createState() =>
      _BasalMetabolicRateScreenState();
}

enum Gender {
  male,
  female,
}

class _BasalMetabolicRateScreenState extends State<BasalMetabolicRateScreen> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0a0b21),
        title: Text("Body Mass Index Calculator"),
      ),
      backgroundColor: Color.fromARGB(255, 12, 13, 39),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCards(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: "MALE"),
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCards(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCards(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.white,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCards(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icone: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icone: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCards(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icone: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icone: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Center(
                        child: Container(
                            child: ResultPage(
                                bmiResult: "1",
                                resultText: "2",
                                interpretation: "3")),
                      ),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ));
            },
            buttonTitle: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
