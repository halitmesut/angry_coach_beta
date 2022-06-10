import 'package:angry_coach_beta/pages/introduction_pages/name.dart';
import 'package:angry_coach_beta/home_page.dart';
import 'package:angry_coach_beta/pages/log_in/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: const Color(0xff0a0e21),
        scaffoldBackgroundColor: const Color.fromARGB(255, 14, 19, 45),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
          backwardsCompatibility: false,
          brightness: Brightness.dark,
        ),
        primarySwatch: Colors.purple,
      ),
      themeMode: ThemeMode.light,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("something went Wrong!!!"));
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return SigninPage();
          }
        },
      ),
    );
  }
}
