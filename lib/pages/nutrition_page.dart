import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 84,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/tea.png",
                          text: "Tea",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/milk.png",
                          text: "Milk",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/cofee.png",
                          text: "Cofee",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/water.png",
                          text: "Water",
                          containersChild: Text("you are in container")),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/bread.png",
                          text: "Bread",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/olive.png",
                          text: "Olive",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/cheese.png",
                          text: "Cheese",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/egg.png",
                          text: "Egg",
                          containersChild: Text("you are in container")),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/cake.png",
                          text: "Cake",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/meatball.png",
                          text: "Meatball",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/fish.png",
                          text: "Fish",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/chicken.png",
                          text: "Chicken",
                          containersChild: Text("you are in container")),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/spagetti.png",
                          text: "Spagetti",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/rice.png",
                          text: "Rice",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/banana.png",
                          text: "Banana",
                          containersChild: Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/salad.png",
                          text: "Salad",
                          containersChild: Text("you are in container")),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: (() {
                    FirebaseAuth.instance.signOut();
                  }),
                  child: NormalListItem(
                      textInput: user.email!,
                      iconData: Icons.flatware,
                      iconColors: Colors.black,
                      topLeftCornerRadius: 30,
                      topRightCornerRadius: 30,
                      bottomLeftCornerRadius: 0,
                      bottomRightCornerRadius: 0),
                )),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: (() {
                    bottomSheetContainer(
                        context, Text("you are in containercontani"));
                  }),
                  child: NormalListItem(
                      textInput: "Aldığın Kaloriyi Gir",
                      iconData: Icons.draw,
                      iconColors: Colors.black,
                      topLeftCornerRadius: 0,
                      topRightCornerRadius: 0,
                      bottomLeftCornerRadius: 30,
                      bottomRightCornerRadius: 30),
                )),
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
