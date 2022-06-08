import 'package:angry_coach_beta/pages/coach_page.dart';
import 'package:angry_coach_beta/pages/me_page.dart';
import 'package:angry_coach_beta/pages/nutrition_page.dart';
import 'package:angry_coach_beta/pages/reports_page.dart';
import 'package:angry_coach_beta/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color.fromARGB(211, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        title: Image.asset(
          'assets/angrycoach.png',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
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
