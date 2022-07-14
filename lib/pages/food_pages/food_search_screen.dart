import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/pages/food_pages/food_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FoodSearchScreen extends StatefulWidget {
  const FoodSearchScreen({Key? key}) : super(key: key);

  @override
  State<FoodSearchScreen> createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends State<FoodSearchScreen> {
  final TextEditingController nutritionController = TextEditingController();
  var userPropertiesBox = Hive.box("userProperties");
  var isLoaded = false;

  List<Food> foods = [];

  //search food method in application food data
  void searchFood(String query) {
    setState(() {
      var filteredFoods = allFoods
          .where(
              (Food) => Food.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      foods = filteredFoods;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("search"),
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
                  hintText: 'Food Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: searchFood,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  // iki listenin toplami kadar saysin  _items.lenght
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable

                    final food = foods[index];

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
                              "${food.gramWeight}gr food | ",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${food.fdcId} id | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.kcalEnergy}kcal | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.gramProtein}gr Prot. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.gramCarbohydrate}gr Carb. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${food.gramFat}gr Fat. | ",
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
                        int sliderAmount = food.gramWeight.toInt();
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
                                                    await userPropertiesBox.put(
                                                        "dailyCal",
                                                        userPropertiesBox.get(
                                                                    "dailyCal") !=
                                                                null
                                                            ? food.kcalEnergy /
                                                                    food
                                                                        .gramWeight *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyCal")
                                                            : food.kcalEnergy /
                                                                food.gramWeight *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyPro",
                                                        userPropertiesBox.get(
                                                                    "dailyPro") !=
                                                                null
                                                            ? food.gramProtein /
                                                                    food
                                                                        .gramWeight *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyPro")
                                                            : food.gramProtein /
                                                                food.gramWeight *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyCar",
                                                        userPropertiesBox.get(
                                                                    "dailyCar") !=
                                                                null
                                                            ? food.gramCarbohydrate /
                                                                    food
                                                                        .gramWeight *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyCar")
                                                            : food.gramCarbohydrate /
                                                                food.gramWeight *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyFat",
                                                        userPropertiesBox.get(
                                                                    "dailyFat") !=
                                                                null
                                                            ? food.gramFat /
                                                                    food
                                                                        .gramWeight *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyFat")
                                                            : food.gramFat /
                                                                food.gramWeight *
                                                                sliderAmount);

                                                    Navigator.of(context).pop();
                                                  },
                                                  textTop: '',
                                                  textBottom: '',
                                                  text: "Add your daily Intske",
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
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
