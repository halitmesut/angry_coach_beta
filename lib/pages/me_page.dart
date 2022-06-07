import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';
import 'package:angry_coach_beta/pages/coach_page.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(90, 91, 89, 89),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Mağaza",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Image.asset('assets/fatgirl.png')),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.face_retouching_natural,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Kuaför",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: const Center(
                  child: Text(
                    "84.4 kg",
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: WideListBottomItem(
                    leftTitle: "Başlangıç",
                    middleTitle: "Haftalık Hedef",
                    rightTitle: "Aylık Hedef",
                    leftInput: 89.5,
                    middleInput: 83.5,
                    rightInput: 80.5),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: NormalListItem(
                textInput: "Haftalık Hediyem",
                iconData: Icons.cruelty_free,
                iconColors: Colors.black,
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
                textInput: "Koçun Aylık Hediyesi",
                iconData: Icons.cruelty_free,
                iconColors: Colors.black,
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
                textInput: "Kilo Değişim Programı",
                iconData: Icons.route,
                iconColors: Colors.black,
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
                textInput: "Diyet Programım",
                iconData: Icons.restaurant_menu,
                iconColors: Colors.black,
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
                textInput: "Koçumun Bana Tavrı",
                iconData: Icons.thumbs_up_down,
                iconColors: Color.fromARGB(255, 0, 0, 0),
                topLeftCornerRadius: 0,
                topRightCornerRadius: 0,
                bottomLeftCornerRadius: 30,
                bottomRightCornerRadius: 30,
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }
}
