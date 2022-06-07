import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Hedef",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "2700",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2, child: Image.asset('assets/progressbar.png')),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Kalan",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "720",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        )
                      ],
                    ),
                  )),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: const [
                    Text(
                      "Alınan",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1980",
                      style: TextStyle(fontSize: 55),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "kcal",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: WideListBottomItem(
                      leftTitle: "Yağ",
                      middleTitle: "Karbonhidrat",
                      rightTitle: "Protein",
                      leftInput: 120,
                      middleInput: 310,
                      rightInput: 98)),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "Yenen Gıdalar",
                    iconData: Icons.soup_kitchen_outlined,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 30,
                    topRightCornerRadius: 30,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0),
              ),
            ),
            SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "Alınan Kaloriler",
                    iconData: Icons.call_merge,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0),
              ),
            ),
            SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "Makro Besinler",
                    iconData: Icons.call_made,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 0,
                    topRightCornerRadius: 0,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0),
              ),
            ),
            SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  containersChild(context, Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "Besin Değerleri",
                    iconData: Icons.call_split,
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
                  containersChild(context, Text("qwe"));
                },
                child: NormalListItem(
                    textInput: "Gelişim Haritam",
                    iconData: Icons.self_improvement,
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
