import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';

class CoachPage extends StatelessWidget {
  const CoachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(90, 91, 89, 89),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 20,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(child: Image.asset('assets/angrycoachh.jpg')),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 30,
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: const Center(
                  child: Text(
                    "Senden sporcu değil çekirge bile olmaz. Daha boğazını tutamıyorsun. Bide utanmadan kakmış benden düzgün bi vücut istiyorsun.",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: NormalListItem(
                textInput: "Günlük Besin Girişi",
                iconData: Icons.check_circle,
                iconColors: Colors.green,
                topLeftCornerRadius: 30,
                topRightCornerRadius: 30,
                bottomLeftCornerRadius: 0,
                bottomRightCornerRadius: 0,
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: NormalListItem(
                textInput: "Kalori Miktarı",
                iconData: Icons.check_circle,
                iconColors: Colors.green,
                topLeftCornerRadius: 0,
                topRightCornerRadius: 0,
                bottomLeftCornerRadius: 0,
                bottomRightCornerRadius: 0,
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: NormalListItem(
                    textInput: "Vitamin Alımı",
                    iconData: Icons.cancel,
                    iconColors: Colors.red,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0)),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: NormalListItem(
                    textInput: "Makro Dengesi",
                    iconData: Icons.cancel,
                    iconColors: Colors.red,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0)),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: NormalListItem(
                    textInput: "Su Tüketimi",
                    iconData: Icons.cancel,
                    iconColors: Colors.red,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 30,
                    bottomRightCornerRadius: 30)),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }
}
