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
      backgroundColor: const Color.fromARGB(90, 91, 89, 89),
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
            SettingsButton(title: "İsim"),
            narrowDivider(),
            SettingsButton(title: "Email"),
            narrowDivider(),
            SettingsButton(title: "Bölge"),
            narrowDivider(),
            SettingsButton(title: "Dil"),
            narrowDivider(),
            SettingsButton(title: "Enerji Birimi"),
            narrowDivider(),
            SettingsButton(title: "Ağırlık Birimi"),
            narrowDivider(),
            SettingsButton(title: "Tavsi Edilen Günlük Kalori"),
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
            SettingsButton(title: "Ağırlık Birimi"),
            narrowDivider(),
            SettingsButton(title: "Tavsi Edilen Günlük Kalori"),
            narrowDivider(),
            SettingsButton(title: "Ağırlık Birimi"),
            narrowDivider(),
            SettingsButton(title: "Tavsi Edilen Günlük Kalori"),
            narrowDivider(),
            SettingsButton(title: "Ağırlık Birimi"),
            narrowDivider(),
            SettingsButton(title: "Tavsi Edilen Günlük Kalori"),
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

class SettingsButton extends StatelessWidget {
  late String title;

  SettingsButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => const Center(
                  child: Text("hello bottom sheet"),
                ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Expanded(
              child: Container(
                height: 20,
                color: const Color.fromARGB(2, 0, 0, 0),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
