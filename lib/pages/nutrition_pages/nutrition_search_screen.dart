import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/pages/nutrition_pages/food_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NutritionSearchScreen extends StatefulWidget {
  const NutritionSearchScreen({Key? key}) : super(key: key);

  @override
  State<NutritionSearchScreen> createState() => _NutritionSearchScreenState();
}

class _NutritionSearchScreenState extends State<NutritionSearchScreen> {
  final TextEditingController nutritionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: MyTextField(
                      textController: nutritionController,
                      icon: Icon(
                        Icons.restaurant_rounded,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.name,
                      obscureText: false,
                      textLabel: "Name"),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onTap: () {
                    debugPrint("hello");
                  },
                )
              ],
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Food Name"),
                  subtitle: Text("Food Category"),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
