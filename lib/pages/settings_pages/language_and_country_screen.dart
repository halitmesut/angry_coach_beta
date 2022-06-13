import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';
import 'package:angry_coach_beta/providers/user_country_provider.dart';
import 'package:angry_coach_beta/providers/user_language_provider.dart';

class LanguageAndCountryScreen extends StatefulWidget {
  const LanguageAndCountryScreen({Key? key}) : super(key: key);

  @override
  State<LanguageAndCountryScreen> createState() =>
      _LanguageAndCountryScreenState();
}

class _LanguageAndCountryScreenState extends State<LanguageAndCountryScreen> {
  @override
  Widget build(BuildContext context) {
    late String selectedCountry = "x";
    late String SelectedLanguage = "x";

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
                height: 50,
              ),
              Text(context.watch<UserCountry>().userCountry,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    exclude: <String>['KN', "MF"],
                    favorite: <String>['tr'],
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      print('Select country: ${country.displayName}');

                      context
                          .read<UserCountry>()
                          .setUserCountry(country.displayNameNoCountryCode);
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottomsheet.
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      // Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('Show country picker'),
              ),
              SizedBox(
                height: 25,
              ),
              Text(context.watch<UserLanguage>().userLanguage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,

                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    exclude: <String>['KN', "MF"],
                    favorite: <String>['tr'],
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      print('Select Language: ${country.displayName}');
                      context
                          .read<UserLanguage>()
                          .setUserLanguage(country.displayName);
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottomsheet.
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      // Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text('Show Language picker'),
              ),
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
                    Navigator.pop(context);
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
