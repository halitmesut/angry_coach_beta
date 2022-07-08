import 'package:angry_coach_beta/pages/coach_page.dart';
import 'package:angry_coach_beta/pages/me_page.dart';
import 'package:angry_coach_beta/pages/nutrition_page.dart';
import 'package:angry_coach_beta/pages/reports_page.dart';
import 'package:angry_coach_beta/pages/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = FirebaseAuth.instance.currentUser!;
    return const MainScreen();
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 2;
  final List<Widget> screens = [
    const ReportPage(),
    const MePage(),
    const NutritionPage(),
    const CoachPage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 248, 248, 248),
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(index: currentIndex, children: screens),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromARGB(255, 37, 63, 66),
            unselectedItemColor: const Color.fromARGB(255, 164, 174, 176),
            elevation: 0,
            selectedFontSize: 13,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.insights),
                label: "Report",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions),
                label: "Me",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant),
                label: "Nutrition",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: "Coach",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_suggest_rounded),
                label: "Setting",
              )
            ],
          ),
        ),
      ),
    );
  }
}
