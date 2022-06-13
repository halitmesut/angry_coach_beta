import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:angry_coach_beta/pages/settings_pages/Notifications_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/basal_metabolic_rate_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/body_mass_index_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/connect_us_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/recalculate_calories_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/language_and_country_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/log_out_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/measurement_unit_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/name_and_email_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/privacy_and_security_screen.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 15),
                const Icon(Icons.person, color: Colors.green),
                const SizedBox(width: 20),
                titleName(title: "Account", size: 25),
              ],
            ),
            normalDivider(),
            const SizedBox(height: 5),
            SettingsButton(
                title: "Name and Email",
                destinationScreenWidgetName: const NameAndEmailScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Language And Country",
                destinationScreenWidgetName: const LanguageAndCountryScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Measurement Units",
                destinationScreenWidgetName: const MeasurementUnitScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Recalculate My Daily Calories",
                destinationScreenWidgetName:
                    const RecalculateMyDailyCaloriesScreen()),
            narrowDivider(),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 15),
                const Icon(Icons.settings, color: Colors.green),
                const SizedBox(width: 20),
                titleName(title: "Additional Tools", size: 25),
              ],
            ),
            normalDivider(),
            SettingsButton(
                title: "Body Mass Index Calculator",
                destinationScreenWidgetName: const BodyMassIndexScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Basal Metabolic Rate",
                destinationScreenWidgetName: const BasalMetabolicRateScreen()),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 15),
                const Icon(Icons.settings, color: Colors.green),
                const SizedBox(width: 20),
                titleName(title: "App Settings", size: 25),
              ],
            ),
            normalDivider(),
            SettingsButton(
                title: "Notificatios",
                destinationScreenWidgetName: const NotificationsScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Privacy and Security",
                destinationScreenWidgetName: const PrivacyAndSecurityScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Connect us",
                destinationScreenWidgetName: const ConnectUsScreen()),
            narrowDivider(),
            SettingsButton(
                title: "Log Out",
                destinationScreenWidgetName: const LogOutScreen()),
            narrowDivider(),
          ],
        ),
      ),
    );
  }

  Text titleName({required String title, required double size}) {
    return Text(
      title,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  Divider normalDivider() {
    return const Divider(
      height: 15,
      thickness: 3,
      color: Colors.blueGrey,
    );
  }

  Divider narrowDivider() {
    return const Divider(
      thickness: 1,
      color: Colors.blueGrey,
    );
  }
}
