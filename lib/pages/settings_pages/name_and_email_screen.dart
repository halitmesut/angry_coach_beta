import 'package:angry_coach_beta/providers/user_name_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NameAndEmailScreen extends StatefulWidget {
  const NameAndEmailScreen({Key? key}) : super(key: key);

  @override
  State<NameAndEmailScreen> createState() => _NameAndEmailScreenState();
}

class _NameAndEmailScreenState extends State<NameAndEmailScreen> {
  final nameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Name and Email",
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
              Text(
                //kullanıcının girmiş olduğu e mail burada yer alıyor
                user.email!,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text("${context.watch<UserNamee>().userName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[a-zA-ZŞşĞğÇçİıÖöÜü]'),
                      allow: true)
                ],
                validator: (value) => value != null && value.length < 3
                    ? "Enter min 3 characters"
                    : null,
                decoration: InputDecoration(
                  labelText: "Name",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
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
                    if (nameController.text.length > 2) {
                      context
                          .read<UserNamee>()
                          .setUserName(nameController.text);

                      Navigator.pop(context);

                      print(nameController.text);
                    }
                  },
                  height: 60,
                  child: Text(
                    "Change User Name",
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
