import 'package:angry_coach_beta/extract/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NameAndEmailScreen extends StatefulWidget {
  const NameAndEmailScreen({Key? key}) : super(key: key);

  @override
  State<NameAndEmailScreen> createState() => _NameAndEmailScreenState();
}

class _NameAndEmailScreenState extends State<NameAndEmailScreen> {
  final nameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  var box = Hive.box("userProperties");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Name and Email",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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
              const SizedBox(
                height: 25,
              ),
              Text(box.get('userName'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 22)),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                textController: nameController,
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                textInputType: TextInputType.name,
                obscureText: false,
                textLabel: "New name",
                validate: (value) => value != null && value.length < 3
                    ? "Enter min 3 characters"
                    : null,
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
                  onPressed: () async {
                    if (nameController.text.length > 2) {
                      await box.put("userName", nameController.text);

                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  },
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Change User Name",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
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
