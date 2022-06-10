import 'package:angry_coach_beta/pages/coach_page.dart';

import 'package:angry_coach_beta/pages/me_page.dart';
import 'package:angry_coach_beta/pages/nutrition_page.dart';
import 'package:angry_coach_beta/pages/reports_page.dart';
import 'package:angry_coach_beta/pages/settings_pages/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    const CoachPage(),
    const MePage(),
    const NutritionPage(),
    const ReportPage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/angrycoach.png',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff0a0e21),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(140, 195, 201, 166),
        iconSize: 25,
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
            icon: Icon(Icons.sports),
            label: "Coach",
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
            icon: Icon(Icons.insights),
            label: "Report",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest_rounded),
            label: "Setting",
          )
        ],
      ),
    );
  }
}