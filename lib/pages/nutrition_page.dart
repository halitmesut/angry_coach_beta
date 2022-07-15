// ignore_for_file: use_build_context_synchronously

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:angry_coach_beta/pages/food_pages/Create_food_page.dart';
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
  var likedFodBox = Hive.box("likedFood");

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
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(1) == null
                                ? 0
                                : likedFodBox.get(1).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(1)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/milk.png",
                        text: "Milk",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(2) == null
                                ? 0
                                : likedFodBox.get(2).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(2)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/cofee.png",
                        text: "Cofee",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(3) == null
                                ? 0
                                : likedFodBox.get(3).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(3)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            int sliderAmount = 1;
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            StatefulBuilder(
                                              builder: (context, state) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "$sliderAmount glass of water",
                                                      style: const TextStyle(
                                                        fontSize: 25.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .baseline,
                                                      textBaseline: TextBaseline
                                                          .alphabetic,
                                                      children: [
                                                        Text(
                                                          '${(sliderAmount * 200).toString()} ml',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Slider(
                                                      value: sliderAmount
                                                          .toDouble(),
                                                      min: 0.0,
                                                      max: 5.0,
                                                      activeColor:
                                                          Colors.deepOrange,
                                                      inactiveColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              193,
                                                              174),
                                                      onChanged:
                                                          (double newValue) {
                                                        state(() {
                                                          sliderAmount =
                                                              newValue.round();
                                                        });
                                                        setState(() {
                                                          sliderAmount =
                                                              newValue.round();
                                                          debugPrint(
                                                              sliderAmount
                                                                  .toString());
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 40,
                                                    ),
                                                    MyButton(
                                                      onPressedFunction:
                                                          () async {
                                                        await Hive.box("userProperties").put(
                                                            "dailyWater",
                                                            Hive.box("userProperties")
                                                                        .get(
                                                                            "dailyWater") !=
                                                                    null
                                                                ? sliderAmount *
                                                                        0.2 +
                                                                    Hive.box(
                                                                            "userProperties")
                                                                        .get(
                                                                            "dailyWater")
                                                                : sliderAmount *
                                                                    0.2);

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      textTop: '',
                                                      textBottom: '',
                                                      text:
                                                          "Add daily Consumption",
                                                      buttonColor:
                                                          Colors.deepOrange,
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)),
                                ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/nutritions/water.png"),
                              const Text(
                                "Water",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/bread.png",
                        text: "Bread",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(5) == null
                                ? 0
                                : likedFodBox.get(5).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(5)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/olive.png",
                        text: "Olive",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(6) == null
                                ? 0
                                : likedFodBox.get(6).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(6)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/cheese.png",
                        text: "Cheese",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(7) == null
                                ? 0
                                : likedFodBox.get(7).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(7)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/egg.png",
                        text: "Egg",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(8) == null
                                ? 0
                                : likedFodBox.get(8).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(8)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/cake.png",
                        text: "Cake",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(9) == null
                                ? 0
                                : likedFodBox.get(9).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(9)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/meatball.png",
                        text: "Meatball",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(10) == null
                                ? 0
                                : likedFodBox.get(10).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(10)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/fish.png",
                        text: "Fish",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(11) == null
                                ? 0
                                : likedFodBox.get(11).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(11)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/chicken.png",
                        text: "Chicken",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(12) == null
                                ? 0
                                : likedFodBox.get(12).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(12)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/spagetti.png",
                        text: "Spagetti",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(13) == null
                                ? 0
                                : likedFodBox.get(13).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(13)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/rice.png",
                        text: "Rice",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(14) == null
                                ? 0
                                : likedFodBox.get(14).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(14)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/banana.png",
                        text: "Banana",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(15) == null
                                ? 0
                                : likedFodBox.get(15).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(15)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      IconAndText(
                        imagesAssetPath: "assets/nutritions/salad.png",
                        text: "Salad",
                        containersChild: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: likedFodBox.get(16) == null
                                ? 0
                                : likedFodBox.get(16).length,
                            itemBuilder: (context, index) {
                              final food = likedFodBox.get(16)[index];
                              return Text(
                                food.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
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
                      iconData: Icons.search_off_outlined,
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
                      iconData: Icons.search,
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
                          textTop: '',
                          textBottom: '',
                          text: "add to daily calorie",
                          buttonColor: Colors.deepOrangeAccent)
                    ],
                  ),
                )),
      );
}
