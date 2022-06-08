import 'package:angry_coach_beta/pages/introduction_pages/purpose.dart';
import 'package:angry_coach_beta/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _userNameInput = TextEditingController();
  String userName = "";

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
                  "What's Your Name?",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                controller: _userNameInput,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[a-zA-ZŞşĞğÇçİıÖöÜü]'),
                      allow: true)
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Your Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    helperStyle: TextStyle(color: Colors.grey),
                    hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: SizedBox(
                      width: 75,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _userNameInput.clear();
                        },
                        color: Colors.white,
                        icon: const Icon(Icons.clear))),
              ),
              Text(
                'Only accept letters from A to Z',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                child: Text("Next page", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userName = _userNameInput.text;
                  if (userName.length > 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PurposeScreen()),
                    );
                    print(userName);
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
