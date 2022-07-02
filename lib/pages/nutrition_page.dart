import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:angry_coach_beta/pages/nutrition_pages/nutrition_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final calorieInputController = TextEditingController();
  var box = Hive.box("userProperties");
  @override
  Widget build(BuildContext context) {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NutritionSearchScreen()));
                  }),
                  child: NormalListItem(
                      textInput: "Aldığın Besini Gir",
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
                    showModalBottomSheet(
                        enableDrag: true,
                        isDismissible: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        context: context,
                        builder: (context) => buildSheet());
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

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context, rootNavigator: true).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() => makeDismissible(
        child: DraggableScrollableSheet(
            initialChildSize: 0.85,
            maxChildSize: 0.9,
            minChildSize: 0.6,
            builder: (_, controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ListView(
                    controller: controller,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 80,
                        child: CloseButton(
                          color: Colors.transparent,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 80,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: CloseButton(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 80,
                        child: CloseButton(
                          color: Colors.transparent,
                        ),
                      ),
                      Text(
                        "please enter the amount of calories you take",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      MyTextField(
                        textController: calorieInputController,
                        icon: Icon(
                          Icons.search_off_outlined,
                        ),
                        textInputType: TextInputType.number,
                        obscureText: false,
                        textLabel: "Kcal",
                      ),
                      SizedBox(height: 150),
                      MyButton(
                          onPressedFunction: () async {
                            if (calorieInputController.text.length < 5) {
                              await box.put(
                                "dailyInput",
                                int.parse(calorieInputController.text) +
                                    box.get("dailyInput"),
                              );

                              // int.parse(box.get("dailyInput")) +
                              //     int.parse(calorieInputController.text)

                              Navigator.of(context).pop();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Your name must be at least 3 letters.",
                                  fontSize: 18,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  timeInSecForIosWeb: 2);
                            }
                          },
                          text: "add to daily calorie",
                          buttonColor: Colors.deepOrangeAccent)
                    ],
                  ),
                )),
      );
}
