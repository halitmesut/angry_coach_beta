import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/model/usersfood.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class CreatedFoodSearchScreen extends StatefulWidget {
  const CreatedFoodSearchScreen({Key? key}) : super(key: key);

  @override
  State<CreatedFoodSearchScreen> createState() =>
      _CreatedFoodSearchScreenState();
}

class _CreatedFoodSearchScreenState extends State<CreatedFoodSearchScreen> {
  var createdFoodBox = Hive.box("createdFood");
  var userPropertiesBox = Hive.box("userProperties");
  var likedFoodBox = Hive.box("likedFood");
  var userDailyValuesBox = Hive.box("userDailyValues");
  var dayTime = DateFormat('yyMMddHH').format(DateTime.now());

  final TextEditingController nutritionController = TextEditingController();
  var isLoaded = false;

  int selectedIconNumber = 0;

  // kullanicin yarattigi food listesi db nin icine kayitli
  List _createdFoods = [];
  List likedFoodList = [];

//search food method in user food local db
  void findAndSet(nutritionController) {
    setState(() {
      var filteredFoods = createdFoodBox.values
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          .where((UsersFood) =>
              UsersFood.name
                  .toLowerCase()
                  .contains(nutritionController.toLowerCase()) ??
              false)
          .toList();

      _createdFoods = filteredFoods;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map allCalories = userDailyValuesBox.get("calorie") ?? {};
    Map allProteins = userDailyValuesBox.get("protein") ?? {};
    Map allCarbohydrates = userDailyValuesBox.get("carbohydrate") ?? {};
    Map allFats = userDailyValuesBox.get("fat") ?? {};
    return Scaffold(
      appBar: AppBar(
        title: const Text("Created Food Search"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                controller: nutritionController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Food',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: findAndSet,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _createdFoods.length,
                  itemBuilder: (context, index) {
                    final food = _createdFoods[index];

                    return GestureDetector(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${food.amount}gr food | ",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${food.id} id | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.calorie}kcal | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.protein}gr Prot. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.carbohydrate}gr Carb. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.fat}gr Fat. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ]),
                      onTap: () {
                        int sliderAmount = food.amount;
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(40),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Amount of ${food.name.toString().toUpperCase()}",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        StatefulBuilder(
                                          builder: (context, state) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    const SizedBox(
                                                      width: 30.0,
                                                    ),
                                                    Text(
                                                      sliderAmount.toString(),
                                                      style: const TextStyle(
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const Text(
                                                      "gr",
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Slider(
                                                  value:
                                                      sliderAmount.toDouble(),
                                                  min: 10.0,
                                                  max: 500.0,
                                                  activeColor:
                                                      Colors.deepOrange,
                                                  inactiveColor:
                                                      const Color.fromARGB(
                                                          255, 255, 193, 174),
                                                  onChanged: (double newValue) {
                                                    state(() {
                                                      sliderAmount =
                                                          newValue.round();
                                                    });
                                                    setState(() {
                                                      sliderAmount =
                                                          newValue.round();
                                                      debugPrint(sliderAmount
                                                          .toString());
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                MyButton(
                                                  onPressedFunction: () async {
                                                    if (allCalories
                                                        .containsKey(dayTime)) {
                                                      allCalories.update(
                                                          dayTime,
                                                          (value) =>
                                                              value +
                                                              food.calorie /
                                                                  food.amount *
                                                                  sliderAmount);
                                                      userDailyValuesBox.put(
                                                          "calorie",
                                                          allCalories);
                                                    } else {
                                                      allCalories[dayTime] =
                                                          food.calorie /
                                                              food.amount *
                                                              sliderAmount;
                                                      userDailyValuesBox.put(
                                                          "calorie",
                                                          allCalories);
                                                    }

                                                    if (allProteins
                                                        .containsKey(dayTime)) {
                                                      allProteins.update(
                                                          dayTime,
                                                          (value) =>
                                                              value +
                                                              food.protein /
                                                                  food.amount *
                                                                  sliderAmount);
                                                      userDailyValuesBox.put(
                                                          "protein",
                                                          allProteins);
                                                    } else {
                                                      allProteins[dayTime] =
                                                          food.protein /
                                                              food.amount *
                                                              sliderAmount;
                                                      userDailyValuesBox.put(
                                                          "protein",
                                                          allProteins);
                                                    }

                                                    if (allCarbohydrates
                                                        .containsKey(dayTime)) {
                                                      allCarbohydrates.update(
                                                          dayTime,
                                                          (value) =>
                                                              value +
                                                              food.carbohydrate /
                                                                  food.amount *
                                                                  sliderAmount);
                                                      userDailyValuesBox.put(
                                                          "carbohydrate",
                                                          allCarbohydrates);
                                                    } else {
                                                      allCarbohydrates[
                                                              dayTime] =
                                                          food.carbohydrate /
                                                              food.amount *
                                                              sliderAmount;
                                                      userDailyValuesBox.put(
                                                          "carbohydrate",
                                                          allCarbohydrates);
                                                    }

                                                    if (allFats
                                                        .containsKey(dayTime)) {
                                                      allFats.update(
                                                          dayTime,
                                                          (value) =>
                                                              value +
                                                              food.fat /
                                                                  food.amount *
                                                                  sliderAmount);
                                                      userDailyValuesBox.put(
                                                          "fat", allFats);
                                                    } else {
                                                      allFats[dayTime] =
                                                          food.fat /
                                                              food.amount *
                                                              sliderAmount;
                                                      userDailyValuesBox.put(
                                                          "fat", allFats);
                                                    }

                                                    // ignore: use_build_context_synchronously
                                                    Navigator.of(context).pop();
                                                  },
                                                  textTop: '',
                                                  textBottom: '',
                                                  text: "Add your daily Intake",
                                                  buttonColor:
                                                      Colors.deepOrange,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        MyButton(
                                            onPressedFunction: () {
                                              Navigator.of(context).pop();
                                              addFoodToIcon(
                                                  context: context,
                                                  foodIndex:
                                                      _createdFoods[index]);
                                            },
                                            textTop: '',
                                            text: 'add to shortcut icon ',
                                            textBottom: '',
                                            buttonColor:
                                                Colors.deepPurpleAccent)
                                      ],
                                    ),
                                  ),
                                ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ));
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void addFoodToIcon({required BuildContext context, required var foodIndex}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Center(
              child: StatefulBuilder(builder: (context, state) {
                return Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            iconPress(
                                imagesAssetPath: "assets/nutritions/tea.png",
                                text: "Tea",
                                iconNumber: 1,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 1;
                                    likedFoodList =
                                        likedFoodBox.get(1) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/milk.png",
                                text: "Milk",
                                iconNumber: 2,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 2;
                                    likedFoodList =
                                        likedFoodBox.get(2) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/cofee.png",
                                text: "Cofee",
                                iconNumber: 3,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 3;
                                    likedFoodList = likedFoodBox.get(3) ?? [];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/water.png",
                                text: "Water",
                                iconNumber: 4,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 4;
                                    likedFoodList =
                                        likedFoodBox.get(4) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            iconPress(
                                imagesAssetPath: "assets/nutritions/bread.png",
                                text: "Bread",
                                iconNumber: 5,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 5;
                                    likedFoodList =
                                        likedFoodBox.get(5) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/olive.png",
                                text: "Olive",
                                iconNumber: 6,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 6;
                                    likedFoodList =
                                        likedFoodBox.get(6) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/cheese.png",
                                text: "Cheese",
                                iconNumber: 7,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 7;
                                    likedFoodList =
                                        likedFoodBox.get(7) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/egg.png",
                                text: "Egg",
                                iconNumber: 8,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 8;
                                    likedFoodList =
                                        likedFoodBox.get(8) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            iconPress(
                                imagesAssetPath: "assets/nutritions/cake.png",
                                text: "Cake",
                                iconNumber: 9,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 9;
                                    likedFoodList =
                                        likedFoodBox.get(9) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath:
                                    "assets/nutritions/meatball.png",
                                text: "Meatball",
                                iconNumber: 10,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 10;
                                    likedFoodList =
                                        likedFoodBox.get(10) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/fish.png",
                                text: "Fish",
                                iconNumber: 11,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 11;
                                    likedFoodList =
                                        likedFoodBox.get(11) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath:
                                    "assets/nutritions/chicken.png",
                                text: "Chicken",
                                iconNumber: 12,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 12;
                                    likedFoodList =
                                        likedFoodBox.get(12) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            iconPress(
                                imagesAssetPath:
                                    "assets/nutritions/spagetti.png",
                                text: "Spagetti",
                                iconNumber: 13,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 13;
                                    likedFoodList =
                                        likedFoodBox.get(13) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/rice.png",
                                text: "Rice",
                                iconNumber: 14,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 14;
                                    likedFoodList =
                                        likedFoodBox.get(14) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/banana.png",
                                text: "Banana",
                                iconNumber: 15,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 15;
                                    likedFoodList =
                                        likedFoodBox.get(15) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                            iconPress(
                                imagesAssetPath: "assets/nutritions/salad.png",
                                text: "Salad",
                                iconNumber: 16,
                                selectedButtonNumber: selectedIconNumber,
                                function: () {
                                  state(() {
                                    selectedIconNumber = 16;
                                    likedFoodList =
                                        likedFoodBox.get(16) ?? <UsersFood>[];
                                    debugPrint('$likedFoodList');
                                  });
                                }),
                          ],
                        ),
                        MyButton(
                            onPressedFunction: () {
                              if (selectedIconNumber != 0) {
                                likedFoodList.add(UsersFood(
                                    id: foodIndex.id,
                                    name: foodIndex.name,
                                    amount: foodIndex.amount,
                                    calorie: foodIndex.calorie,
                                    carbohydrate: foodIndex.carbohydrate,
                                    protein: foodIndex.protein,
                                    fat: foodIndex.fat));
                                // debugPrint(foodIndex.id.toString());
                                // debugPrint(foodIndex.name.toString());
                                // debugPrint(foodIndex.amount.toString());
                                // debugPrint(foodIndex.calorie.toString());
                                // debugPrint(foodIndex.carbohydrate.toString());
                                // debugPrint(foodIndex.fat.toString());
                                debugPrint('$likedFoodList');
                                likedFoodBox.put(
                                    selectedIconNumber, likedFoodList);
                                //debugPrint('${likedFoodBox.get()}');
                                Navigator.of(context).pop();
                                selectedIconNumber = 0;
                              } else {
                                selectedIconNumber = 0;
                                Fluttertoast.showToast(
                                    msg: "You have to choose a category.",
                                    fontSize: 18,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 200, 200),
                                    textColor: Colors.black,
                                    timeInSecForIosWeb: 2);
                              }
                            },
                            textTop: '',
                            text: 'add to shortcut iconn',
                            textBottom: '',
                            buttonColor: Colors.deepPurpleAccent)
                      ],
                    ));
              }),
            ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ));
  }

  Widget iconPress({
    required String imagesAssetPath,
    required String text,
    required int iconNumber,
    required int selectedButtonNumber,
    required Function()? function,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            color: iconNumber == selectedButtonNumber
                ? const Color.fromARGB(255, 192, 170, 255)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagesAssetPath),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
