import 'package:angry_coach_beta/providers/user_properties_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LanguageAndCountryScreen extends StatefulWidget {
  const LanguageAndCountryScreen({Key? key}) : super(key: key);

  @override
  State<LanguageAndCountryScreen> createState() =>
      _LanguageAndCountryScreenState();
}

class _LanguageAndCountryScreenState extends State<LanguageAndCountryScreen> {
  @override
  Widget build(BuildContext context) {
    final languageList = [
      "English",
      "Franch",
      "Spanish",
      "German",
      "Turkish",
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Country and Language",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 2,
              ),
              ListTile(
                title: const Text(
                  "Language",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(context.watch<UserProperties>().userLanguage),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                context
                                    .read<UserProperties>()
                                    .getUserLanguage(languageList[index]);
                              },
                              children: languageList
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: const Text(
                  "Country",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(context.watch<UserProperties>().userCountry),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
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
                          .read<UserProperties>()
                          .getUserCountry(country.displayNameNoCountryCode);
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottomsheet.
                      borderRadius: const BorderRadius.only(
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
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              const Expanded(
                child: SizedBox(
                  height: 25,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border(
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
