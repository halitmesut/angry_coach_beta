import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:angry_coach_beta/pages/nutrition_pages/Create_food_page.dart';
import 'package:angry_coach_beta/pages/food_pages/food_search_screen.dart';
import 'package:angry_coach_beta/pages/food_pages/created_food_search_screen.dart';
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
              flex: 74,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/tea.png",
                          text: "Tea",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/milk.png",
                          text: "Milk",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/cofee.png",
                          text: "Cofee",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/water.png",
                          text: "Water",
                          containersChild: const Text("you are in container")),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/bread.png",
                          text: "Bread",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/olive.png",
                          text: "Olive",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/cheese.png",
                          text: "Cheese",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/egg.png",
                          text: "Egg",
                          containersChild: const Text("you are in container")),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/cake.png",
                          text: "Cake",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/meatball.png",
                          text: "Meatball",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/fish.png",
                          text: "Fish",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/chicken.png",
                          text: "Chicken",
                          containersChild: const Text("you are in container")),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/spagetti.png",
                          text: "Spagetti",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/rice.png",
                          text: "Rice",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/banana.png",
                          text: "Banana",
                          containersChild: const Text("you are in container")),
                      IconAndText(
                          imagesAssetPath: "assets/nutritions/salad.png",
                          text: "Salad",
                          containersChild: const Text("you are in container")),
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
                            builder: (context) =>
                                const CreatedFoodSearchScreen()));
                  }),
                  child: NormalListItem(
                      textInput: "Created Food Search",
                      iconData: Icons.search,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodSearchScreen()));
                  }),
                  child: NormalListItem(
                      textInput: "Search Food",
                      iconData: Icons.search_off_outlined,
                      iconColors: Colors.black,
                      topLeftCornerRadius: 0,
                      topRightCornerRadius: 0,
                      bottomLeftCornerRadius: 0,
                      bottomRightCornerRadius: 0),
                )),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateFoodScreen()));
                  }),
                  child: NormalListItem(
                      textInput: "Create Food",
                      iconData: Icons.add,
                      iconColors: Colors.black,
                      topLeftCornerRadius: 0,
                      topRightCornerRadius: 0,
                      bottomLeftCornerRadius: 0,
                      bottomRightCornerRadius: 0),
                )),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        enableDrag: true,
                        isDismissible: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        context: context,
                        builder: (context) => buildSheet());
                  },
                  child: NormalListItem(
                      textInput: "Enter Calories",
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
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ListView(
                    controller: controller,
                    children: [
                      const SizedBox(
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
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const CloseButton(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                        width: 80,
                        child: CloseButton(
                          color: Colors.transparent,
                        ),
                      ),
                      const Text(
                        "please enter the amount of calories you take",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      MyTextField(
                        textController: calorieInputController,
                        icon: const Icon(
                          Icons.search_off_outlined,
                        ),
                        textInputType: TextInputType.number,
                        obscureText: false,
                        textLabel: "Kcal",
                      ),
                      const SizedBox(height: 150),
                      MyButton(
                          onPressedFunction: () async {
                            if (calorieInputController.text.length < 5) {
                              // await box.put("dailyInput", 0);
                              await box.put(
                                "dailyCal",
                                int.parse(calorieInputController.text) +
                                    box.get("dailyCal"),
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                              calorieInputController.clear();
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Your input calories lenght must not be shorter than 5 character. ",
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
