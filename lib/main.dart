import 'package:angry_coach_beta/extract/themes.dart';
import 'package:angry_coach_beta/home_page.dart';
import 'package:angry_coach_beta/pages/log_in/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("userProperties");
  await Hive.openBox("darkMode");
  await Hive.openBox("createdFood");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  static const String title = "on boarding example";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("darkMode").listenable(),
        builder: (context, Box box, widget) {
          var darkMode = box.get("darkMode", defaultValue: false);
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: title,
            theme: myLightTheme(),
            darkTheme: myDarkTheme(),
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
              Locale('es'),
              Locale('el'),
              Locale('et'),
              Locale('nb'),
              Locale('nn'),
              Locale('pl'),
              Locale('pt'),
              Locale('ru'),
              Locale('hi'),
              Locale('ne'),
              Locale('uk'),
              Locale('hr'),
              Locale('tr'),
              Locale.fromSubtags(
                  languageCode: 'zh',
                  scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
              Locale.fromSubtags(
                  languageCode: 'zh',
                  scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
            ],
            localizationsDelegates: const [
              CountryLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("something went Wrong!!!"));
                } else if (snapshot.hasData) {
                  return const HomePage();
                } else {
                  return const AuthPage();
                }
              },
            ),
          );
        });
  }
}
