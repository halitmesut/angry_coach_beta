import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/model/usersfood.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/widgets_atitional_apps.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NutritionSearchScreen extends StatefulWidget {
  const NutritionSearchScreen({Key? key}) : super(key: key);

  @override
  State<NutritionSearchScreen> createState() => _NutritionSearchScreenState();
}

class _NutritionSearchScreenState extends State<NutritionSearchScreen> {
  var foodBox = Hive.box("createdFood");
  var userPropertiesBox = Hive.box("userProperties");

  final TextEditingController nutritionController = TextEditingController();
  var isLoaded = false;
  List _items = [];

  void findAndSet(String value) {
    setState(() {
      var filteredFoods = foodBox.values
          .where((UsersFood) =>
              UsersFood.name?.contains(value.toLowerCase()) ?? false)
          .toList();
      print(filteredFoods.length);
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
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    UsersFood usersFood = foodBox.getAt(index);
                    return GestureDetector(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //     '${_items.map((e) => '${e.name} - ${e.calorie}').join('-----')} '),

                            Text(
                              _items[index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${_items[index].amount}gr food | ",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${_items[index].id} id | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${_items[index].calorie}kcal | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${_items[index].protein}gr Prot. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${_items[index].carbohydrate}gr Carb. | ",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${_items[index].fat}gr Fat. | ",
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
                        int sliderAmount = 100;
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
                                          "Amount of ${_items[index].name.toString().toUpperCase()}",
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
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Slider(
                                                  value:
                                                      sliderAmount.toDouble(),
                                                  min: 10.0,
                                                  max: 500.0,
                                                  activeColor:
                                                      Colors.deepOrange,
                                                  inactiveColor: Color.fromARGB(
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
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                MyButton(
                                                  onPressedFunction: () {},
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

//