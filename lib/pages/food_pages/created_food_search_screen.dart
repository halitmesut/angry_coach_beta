import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/model/usersfood.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreatedFoodSearchScreen extends StatefulWidget {
  const CreatedFoodSearchScreen({Key? key}) : super(key: key);

  @override
  State<CreatedFoodSearchScreen> createState() =>
      _CreatedFoodSearchScreenState();
}

class _CreatedFoodSearchScreenState extends State<CreatedFoodSearchScreen> {
  var foodBox = Hive.box("createdFood");
  var userPropertiesBox = Hive.box("userProperties");

  final TextEditingController nutritionController = TextEditingController();
  var isLoaded = false;

  // kullanicin yarattigi food listesi db nin icine kayitli
  List _createdFoods = [];

//search food method in user food local db
  void findAndSet(nutritionController) {
    setState(() {
      var filteredFoods = foodBox.values
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
                                                    await userPropertiesBox.put(
                                                        "dailyCal",
                                                        userPropertiesBox.get(
                                                                    "dailyCal") !=
                                                                null
                                                            ? food.calorie /
                                                                    food
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyCal")
                                                            : food.calorie /
                                                                food.amount *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyPro",
                                                        userPropertiesBox.get(
                                                                    "dailyPro") !=
                                                                null
                                                            ? food.protein /
                                                                    food
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyPro")
                                                            : food.protein /
                                                                food.amount *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyCar",
                                                        userPropertiesBox.get(
                                                                    "dailyCar") !=
                                                                null
                                                            ? food.carbohydrate /
                                                                    food
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyCar")
                                                            : food.carbohydrate /
                                                                food.amount *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyFat",
                                                        userPropertiesBox.get(
                                                                    "dailyFat") !=
                                                                null
                                                            ? food.fat /
                                                                    food
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyFat")
                                                            : food.fat /
                                                                food.amount *
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
