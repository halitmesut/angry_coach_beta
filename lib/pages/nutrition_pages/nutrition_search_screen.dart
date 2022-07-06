import 'package:angry_coach_beta/extract/my_text_field.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: MyTextField(
                      textController: nutritionController,
                      icon: const Icon(
                        Icons.restaurant_rounded,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.name,
                      obscureText: false,
                      textLabel: "Name"),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onTap: () {
                    setState(() {});

                    debugPrint(foodBox.length.toString());
                  },
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: foodBox.length,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodBox.getAt(index)[0].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "${foodBox.getAt(index)[1].toString()}gr food |",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${foodBox.getAt(index)[2].toString()}kcal |",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${foodBox.getAt(index)[3].toString()}gr Prot. |",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${foodBox.getAt(index)[4].toString()}gr Carb. |",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${foodBox.getAt(index)[5].toString()}gr Fat. |",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
