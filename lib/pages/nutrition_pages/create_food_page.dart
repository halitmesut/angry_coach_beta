import 'dart:ui';

import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:flutter/material.dart';

class CreateFoodScreen extends StatefulWidget {
  const CreateFoodScreen({Key? key}) : super(key: key);

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
  final TextEditingController foodNameController = TextEditingController();
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
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
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
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "welcome",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
