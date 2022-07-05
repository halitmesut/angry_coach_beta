import 'package:angry_coach_beta/extract/my_button.dart';
import 'package:angry_coach_beta/extract/my_text_field.dart';
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
  final TextEditingController foodAmountontroller = TextEditingController();
  final TextEditingController energyAmountController = TextEditingController();
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
        padding: const EdgeInsets.all(18),
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
                      textController: foodAmountontroller,
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
                      textController: energyAmountController,
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
                  if (foodNameController.text.length > 1 &&
                      foodAmountontroller.text.isNotEmpty &&
                      energyAmountController.text.isNotEmpty &&
                      proteinAmountController.text.isNotEmpty &&
                      carbAmountController.text.isNotEmpty &&
                      fatAmountController.text.isNotEmpty) {
                    foodBox.put(foodNameController.text.toLowerCase(), <String>[
                      foodAmountontroller.text,
                      energyAmountController.text,
                      proteinAmountController.text,
                      carbAmountController.text,
                      fatAmountController.text
                    ]);
                    await userPropertiesBox.put(
                      "dailyInput",
                      int.parse(energyAmountController.text) +
                          userPropertiesBox.get("dailyInput"),
                    );
                    Navigator.of(context).pop();
                    foodNameController.clear();
                    foodNameController.clear();
                    energyAmountController.clear();
                    proteinAmountController.clear();
                    carbAmountController.clear();
                    fatAmountController.clear();
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
                text: 'Create Food',
                buttonColor: Colors.deepOrangeAccent),
            const SizedBox(height: 20),
            MyButton(
                onPressedFunction: () async {
                  if (foodNameController.text.length > 1 &&
                      foodAmountontroller.text.isNotEmpty &&
                      energyAmountController.text.isNotEmpty &&
                      proteinAmountController.text.isNotEmpty &&
                      carbAmountController.text.isNotEmpty &&
                      fatAmountController.text.isNotEmpty) {
                    foodBox.put(foodNameController.text.toLowerCase(), <String>[
                      foodAmountontroller.text,
                      energyAmountController.text,
                      proteinAmountController.text,
                      carbAmountController.text,
                      fatAmountController.text
                    ]);
                    await userPropertiesBox.put(
                      "dailyInput",
                      int.parse(foodBox
                              .get(foodNameController.text.toLowerCase())[1]) +
                          userPropertiesBox.get("dailyInput"),
                    );
                    Navigator.of(context).pop();
                    foodNameController.clear();
                    foodNameController.clear();
                    energyAmountController.clear();
                    proteinAmountController.clear();
                    carbAmountController.clear();
                    fatAmountController.clear();

                    debugPrint(foodBox.toMap().toString());
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
                text: 'Create & Add My Calories',
                buttonColor: Colors.deepOrangeAccent),
          ],
        ),
      ),
    );
  }
}
