// ignore_for_file: use_build_context_synchronously

import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/model/usersfood.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreateFoodScreen extends StatefulWidget {
  const CreateFoodScreen({Key? key}) : super(key: key);

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
  var foodBox = Hive.box("createdFood");
  var userPropertiesBox = Hive.box("userProperties");
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodAmountController = TextEditingController();
  final TextEditingController calorieAmountController = TextEditingController();
  final TextEditingController proteinAmountController = TextEditingController();
  final TextEditingController carbAmountController = TextEditingController();
  final TextEditingController fatAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Food"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Food Name",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: const Icon(
                        Icons.menu_book,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.name,
                      obscureText: false,
                      textLabel: "Name"),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Food Amount",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodAmountController,
                      icon: const Icon(
                        Icons.scale,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Energy Amount",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: calorieAmountController,
                      icon: const Icon(
                        Icons.bolt,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "kcal"),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Protein Amount",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: proteinAmountController,
                      icon: const Icon(
                        Icons.account_tree,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Carb. Amount",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: carbAmountController,
                      icon: const Icon(
                        Icons.account_tree,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Fat Amount",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: fatAmountController,
                      icon: const Icon(
                        Icons.account_tree,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            MyButton(
                onPressedFunction: () async {
                  if (foodNameController.text.isNotEmpty &&
                      foodAmountController.text.isNotEmpty &&
                      calorieAmountController.text.isNotEmpty &&
                      proteinAmountController.text.isNotEmpty &&
                      carbAmountController.text.isNotEmpty &&
                      fatAmountController.text.isNotEmpty) {
                    await foodBox.add(UsersFood(
                        id: foodBox.length,
                        name: foodNameController.text.toLowerCase(),
                        amount: int.parse(foodAmountController.text),
                        calorie: int.parse(calorieAmountController.text),
                        carbohydrate: int.parse(carbAmountController.text),
                        protein: int.parse(proteinAmountController.text),
                        fat: int.parse(fatAmountController.text)));
                    Navigator.of(context).pop();
                    foodNameController.clear();
                    foodNameController.clear();
                    calorieAmountController.clear();
                    proteinAmountController.clear();
                    carbAmountController.clear();
                    fatAmountController.clear();
                  } else {
                    userPropertiesBox.put('dailyInput', 0);
                    debugPrint(userPropertiesBox.get('dailyInput').toString());
                    Fluttertoast.showToast(
                        msg: "You must enter all fields.",
                        fontSize: 18,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 2);
                  }
                },
                text: 'Create Food',
                buttonColor: Colors.deepOrangeAccent),
            const SizedBox(height: 20),
            MyButton(
                onPressedFunction: () async {
                  if (foodNameController.text.isNotEmpty &&
                      foodAmountController.text.isNotEmpty &&
                      calorieAmountController.text.isNotEmpty &&
                      proteinAmountController.text.isNotEmpty &&
                      carbAmountController.text.isNotEmpty &&
                      fatAmountController.text.isNotEmpty) {
                    await foodBox.add(UsersFood(
                        id: foodBox.length,
                        name: foodNameController.text.toLowerCase(),
                        amount: int.parse(foodAmountController.text),
                        calorie: int.parse(calorieAmountController.text),
                        carbohydrate: int.parse(carbAmountController.text),
                        protein: int.parse(proteinAmountController.text),
                        fat: int.parse(fatAmountController.text)));

                    await userPropertiesBox.put(
                        "dailyCal",
                        userPropertiesBox.get("dailyCal") != null
                            ? int.parse(calorieAmountController.text) +
                                userPropertiesBox.get("dailyCal")
                            : int.parse(calorieAmountController.text));
                    await userPropertiesBox.put(
                        "dailyPro",
                        userPropertiesBox.get("dailyPro") != null
                            ? int.parse(proteinAmountController.text) +
                                userPropertiesBox.get("dailyPro")
                            : int.parse(proteinAmountController.text));
                    await userPropertiesBox.put(
                        "dailyCar",
                        userPropertiesBox.get("dailyCar") != null
                            ? int.parse(carbAmountController.text) +
                                userPropertiesBox.get("dailyCar")
                            : int.parse(carbAmountController.text));
                    await userPropertiesBox.put(
                        "dailyFat",
                        userPropertiesBox.get("dailyFat") != null
                            ? int.parse(fatAmountController.text) +
                                userPropertiesBox.get("dailyFat")
                            : int.parse(fatAmountController.text));

                    Navigator.of(context).pop();
                    foodNameController.clear();
                    foodAmountController.clear();
                    calorieAmountController.clear();
                    proteinAmountController.clear();
                    carbAmountController.clear();
                    fatAmountController.clear();

                    foodBox.clear();

                    debugPrint(foodBox.toMap().toString());

                    userPropertiesBox.put('dailyInput', 0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "You must enter all fields.",
                        fontSize: 18,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 2);
                  }
                },
                text: 'Create & Add Daily Calories',
                buttonColor: Colors.deepOrangeAccent),
          ],
        ),
      ),
    );
  }
}
