import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({Key? key}) : super(key: key);

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
              flex: 84,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/tea.png",
                          text: "Tea"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/milk.png",
                          text: "Milk"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/cofee.png",
                          text: "Cofee"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/water.png",
                          text: "Water"),
                    ],
                  ),
                  Row(
                    children: [
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/bread.png",
                          text: "Bread"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/olive.png",
                          text: "Olive"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/cheese.png",
                          text: "Cheese"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/egg.png",
                          text: "Egg"),
                    ],
                  ),
                  Row(
                    children: [
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/cake.png",
                          text: "Cake"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/meatball.png",
                          text: "Meatball"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/fish.png",
                          text: "Fish"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/chicken.png",
                          text: "Chicken"),
                    ],
                  ),
                  Row(
                    children: [
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/spagetti.png",
                          text: "Spagetti"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/rice.png",
                          text: "Rice"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/banana.png",
                          text: "Banana"),
                      iconAndText(
                          imagesAssetPath: "assets/nutritions/salad.png",
                          text: "Salad"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 10,
                child: NormalListItem(
                    textInput: "Yediğin Besini Gir",
                    iconData: Icons.flatware,
                    iconColors: Colors.black,
                    topLeftCornerRadius: 30,
                    topRightCornerRadius: 30,
                    bottomLeftCornerRadius: 0,
                    bottomRightCornerRadius: 0)),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: NormalListItem(
                    textInput: "Yediğin Besini Gir",
                    iconData: Icons.draw,
                    iconColors: Colors.black,
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
