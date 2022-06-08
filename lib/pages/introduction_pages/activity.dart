import 'package:angry_coach_beta/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final _userActivityInput = TextEditingController();
  String userActivity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "What's Your Activity Level?",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: _userActivityInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[1-4]'), allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Make a choice",
                    hintStyle: TextStyle(color: Colors.grey),
                    helperStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _userActivityInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              Text(
                '1 = Not very active',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2 = Less active',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '3 = Active',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '4 = Very Active',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text("Next page", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userActivity = _userActivityInput.text;
                  if (userActivity != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


//  Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MainScreen()),
//                     );