import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

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
                  bottomSheetContainer(context, const Text("holaaaaaa"));
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
                  child: const Center(
                    child: Text(
                      "84.4 kg",
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
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
                      leftInput: 89.5,
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
