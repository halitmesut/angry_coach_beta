import 'package:flutter/material.dart';

class LanguageAndCountryScreen extends StatefulWidget {
  const LanguageAndCountryScreen({Key? key}) : super(key: key);

  @override
  State<LanguageAndCountryScreen> createState() =>
      _LanguageAndCountryScreenState();
}

class _LanguageAndCountryScreenState extends State<LanguageAndCountryScreen> {
  @override
  Widget build(BuildContext context) {
    late String country = "x";
    late String language = "x";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Country and Language",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  child: Text("Country"),
                  onPressed: () {
                    country = "Turkey";
                    print(country);
                  }),
              TextButton(
                  child: Text("Language"),
                  onPressed: () {
                    language = "Turkish";
                    print(language);
                  }),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  elevation: 0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    if (language != "x" && country != "x") {
                      print(country);
                      print(language);
                    }
                  },
                  height: 60,
                  child: Text(
                    "Set",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
