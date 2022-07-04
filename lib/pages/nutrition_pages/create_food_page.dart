import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:flutter/material.dart';

class CreateFoodScreen extends StatefulWidget {
  const CreateFoodScreen({Key? key}) : super(key: key);

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodAmountontroller = TextEditingController();
  final TextEditingController energyAmountController = TextEditingController();
  final TextEditingController proteinAmountController = TextEditingController();
  final TextEditingController carbAmounController = TextEditingController();
  final TextEditingController fatAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Food"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Food Name",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.name,
                      obscureText: false,
                      textLabel: "Name"),
                )
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Food Amount",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                )
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Energy Amount",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "kcal"),
                )
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Protein Amount",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                )
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Carb. Amount",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                )
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fat Amount",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyTextField(
                      textController: foodNameController,
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.number,
                      obscureText: false,
                      textLabel: "gr"),
                ),
              ],
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
