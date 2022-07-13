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
  List _items = [];

//search food method in user food local db
  void findAndSet(String value) {
    setState(() {
      var filteredFoods = foodBox.values
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          .where((UsersFood) =>
              UsersFood.name?.toLowerCase().contains(value.toLowerCase()))
          .toList();

      _items = filteredFoods;
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
                onChanged: findAndSet,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  // iki listenin toplami kadar saysin  _items.lenght
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    UsersFood usersFood = foodBox.getAt(index);

                    return GestureDetector(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ListTile(
                            //   title: Text(food.name),
                            // ),
                            Text(
                              usersFood.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${usersFood.amount}gr food | ",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${usersFood.id} id | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${usersFood.calorie}kcal | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${usersFood.protein}gr Prot. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${usersFood.carbohydrate}gr Carb. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${usersFood.fat}gr Fat. | ",
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
                        int sliderAmount = usersFood.amount;
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
                                          "Amount of ${usersFood.name.toString().toUpperCase()}",
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
                                                            ? usersFood.calorie /
                                                                    usersFood
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyCal")
                                                            : usersFood
                                                                    .calorie /
                                                                usersFood
                                                                    .amount *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyPro",
                                                        userPropertiesBox.get(
                                                                    "dailyPro") !=
                                                                null
                                                            ? usersFood.protein /
                                                                    usersFood
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyPro")
                                                            : usersFood
                                                                    .protein /
                                                                usersFood
                                                                    .amount *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyCar",
                                                        userPropertiesBox.get(
                                                                    "dailyCar") !=
                                                                null
                                                            ? usersFood.carbohydrate /
                                                                    usersFood
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyCar")
                                                            : usersFood
                                                                    .carbohydrate /
                                                                usersFood
                                                                    .amount *
                                                                sliderAmount);
                                                    await userPropertiesBox.put(
                                                        "dailyFat",
                                                        userPropertiesBox.get(
                                                                    "dailyFat") !=
                                                                null
                                                            ? usersFood.fat /
                                                                    usersFood
                                                                        .amount *
                                                                    sliderAmount +
                                                                userPropertiesBox
                                                                    .get(
                                                                        "dailyFat")
                                                            : usersFood.fat /
                                                                usersFood
                                                                    .amount *
                                                                sliderAmount);

                                                    Navigator.of(context).pop();
                                                  },
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
