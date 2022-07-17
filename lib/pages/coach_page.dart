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
                        if (box.get("calorie") == 0 &&
                            box.get("dailyWater") == 0) {
                          return Text(veryBadSpeech[0],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else if (box.get("dailyCal") <
                                box.get("userReccommendedDailyIntake") * 0.9 &&
                            box.get("dailyWater") <
                                box.get("userWeight") * 0.035 * 0.9) {
                          return Text(badSpeech[0],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else if (box.get("dailyCal") >
                                box.get("userReccommendedDailyIntake") * 1.1 &&
                            box.get("dailyWater") >
                                box.get("userWeight") * 0.035 * 0.9) {
                          return Text(normalSpeech[0],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else if (box.get("userReccommendedDailyIntake") *
                                    0.5 <
                                box.get("dailyCal") &&
                            box.get("dailyCal") <
                                box.get("userReccommendedDailyIntake") * 0.9 &&
                            box.get("dailyWater") >
                                box.get("userWeight") * 0.035 * 0.9) {
                          return Text(goodSpeech[0],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else if (box.get("userReccommendedDailyIntake") *
                                    0.9 <
                                box.get("dailyCal") &&
                            box.get("dailyCal") <
                                box.get("userReccommendedDailyIntake") * 1.1 &&
                            box.get("dailyWater") >
                                box.get("userWeight") * 0.035 * 0.9) {
                          return Text(veryGoodSpeech[0],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22));
                        } else {
                          return const Text(
                              'if else yapisinda hata var !!! hata var',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22));
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
                      "Senden gün içinde yediğin leblebi tanesini bile bana söylemeni istiyorum. Birşeyler yer ve bana söylemezen kızarım. Söylersen ise düzgün bir programla yolumuza devam eder, bizi görenleri hayretlere düşürürüz.");
                },
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("userProperties").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get("dailyCal") > 0) {
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
                  bottomSheetText(context,
                      "Sana o kadar güzel bir kalori hesabı yaptım ki, harfiyyen uyman gerekiyor. Ne çok fazla, ne çok az. Tam sana göre. Fakat senin için yüzde 10'luk bir sapmayı gözardı edebilirim. Bu miktarın dışındaki sapmalarda çok öfkelenirim.");
                },
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("userProperties").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get("dailyCal") /
                                box.get("userReccommendedDailyIntake") >
                            0.9 &&
                        box.get("dailyCal") /
                                box.get("userReccommendedDailyIntake") <
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
                    valueListenable: Hive.box("userProperties").listenable(),
                    builder: (context, Box box, _) {
                      if (box.get("dailyWater") >
                          box.get("userWeight") * 0.035 * 0.9) {
                        return NormalListItem(
                          textInput: "Water Consumption",
                          iconData: Icons.check,
                          iconColors: Colors.green,
                          topLeftCornerRadius: 0,
                          topRightCornerRadius: 0,
                          bottomLeftCornerRadius: 30,
                          bottomRightCornerRadius: 30,
                        );
                      } else {
                        return NormalListItem(
                          textInput: "Water Consumption",
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
