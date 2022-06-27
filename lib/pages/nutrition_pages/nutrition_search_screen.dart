import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:angry_coach_beta/pages/nutrition_pages/models/post.dart';
import 'package:angry_coach_beta/pages/nutrition_pages/services/remote_service.dart';
import 'package:flutter/material.dart';

class NutritionSearchScreen extends StatefulWidget {
  const NutritionSearchScreen({Key? key}) : super(key: key);

  @override
  State<NutritionSearchScreen> createState() => _NutritionSearchScreenState();
}

class _NutritionSearchScreenState extends State<NutritionSearchScreen> {
  final TextEditingController nutritionController = TextEditingController();

  List<Post>? posts;
  var isLoaded = false;

  getData() async {
    posts = await RemoteService().getPost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      debugPrint("get data içinde hata var");
    }
  }

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
                    getData();

                    setState(() {});

                    debugPrint("lkjl");
                  },
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              posts![index].body ?? "",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ]),
                    );

                    // ListTile(
                    //   title: Text(posts![index].title),
                    //   subtitle: Text(posts![index].body.toString()),
                    //   isThreeLine: true,
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
