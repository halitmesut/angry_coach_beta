import 'dart:convert';
import 'package:flutter/material.dart';

class JsonFood extends StatefulWidget {
  const JsonFood({Key? key}) : super(key: key);

  @override
  State<JsonFood> createState() => _JsonFoodState();
}

class _JsonFoodState extends State<JsonFood> {
  late List food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('foods'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/fooddata_survey.json'),
            builder: (context, snapshot) {
              food = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                  itemCount: food == null ? 0 : food.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('name = ' + food[index]["description"]),
                          Text('portion Description = ' +
                              food[index]["foodPortions"][0]
                                  ["portionDescription"]),
                          Text('gram Weight = ' +
                              food[index]["foodPortions"][0]["gramWeight"]
                                  .toString()),
                          Text(food[index]["foodNutrients"][0]["nutrient"]
                                  ["name"] +
                              ' = ' +
                              food[index]["foodNutrients"][0]["amount"]
                                  .toString() +
                              food[index]["foodNutrients"][0]["nutrient"]
                                  ["unitName"]),
                          Text(food[index]["foodNutrients"][1]["nutrient"]
                                  ["name"] +
                              ' = ' +
                              food[index]["foodNutrients"][1]["amount"]
                                  .toString() +
                              food[index]["foodNutrients"][1]["nutrient"]
                                  ["unitName"]),
                          Text(food[index]["foodNutrients"][2]["nutrient"]
                                  ["name"] +
                              ' = ' +
                              food[index]["foodNutrients"][2]["amount"]
                                  .toString() +
                              food[index]["foodNutrients"][2]["nutrient"]
                                  ["unitName"]),
                          Text(food[index]["foodNutrients"][3]["nutrient"]
                                  ["name"] +
                              ' = ' +
                              food[index]["foodNutrients"][3]["amount"]
                                  .toString() +
                              food[index]["foodNutrients"][3]["nutrient"]
                                  ["unitName"])
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}