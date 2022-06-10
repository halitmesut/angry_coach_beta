import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/constants_aditional_apps.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/widgets_atitional_apps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class BodyMassIndexScreen extends StatefulWidget {
  const BodyMassIndexScreen({Key? key}) : super(key: key);

  @override
  State<BodyMassIndexScreen> createState() => _BodyMassIndexScreenState();
}

class _BodyMassIndexScreenState extends State<BodyMassIndexScreen> {
  Gender selectedGenderBody = Gender.female;
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
                        selectedGenderBody = Gender.male;
                      });
                      print(selectedGenderBody);
                    },
                    child: ReusableCards(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: "MALE"),
                      colour: selectedGenderBody == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderBody = Gender.female;
                      });
                      print(selectedGenderBody);
                    },
                    child: ReusableCards(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                      colour: selectedGenderBody == Gender.female
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
                      print(height);
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
                              onLongPres: () {
                                setState(() {
                                  age = age - 10;
                                });
                                print(age);
                              },
                              icone: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                  print(weight);
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              onLongPres: () {
                                setState(() {
                                  age = age + 10;
                                });
                                print(age);
                              },
                              icone: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                  print(weight);
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
                              onLongPres: () {
                                setState(() {
                                  age = age + 10;
                                });
                                print(age);
                              },
                              icone: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                  print(age);
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              onLongPres: () {
                                setState(() {
                                  age = age + 10;
                                });
                                print(age);
                              },
                              icone: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                                print(age);
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
              CalculatorBrain calc = CalculatorBrain(
                  age: age,
                  weight: weight,
                  height: height,
                  selecteddGender: selectedGenderBody);
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            calc.getStatusExplanation(),
                            style: kResultTextStyle,
                          ),
                          Text(
                            calc.boadyMassIndex(),
                            style: kBMITextStyle,
                          ),
                          Text(
                            calc.getInterpretation(),
                            style: kBodyTextStyle,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  backgroundColor: Color(0xff0a0e21));
            },
            buttonTitle: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
