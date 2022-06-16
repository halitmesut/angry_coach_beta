import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.textController,
      required this.icon,
      required this.textInputType,
      required this.obscureText,
      required this.textLabel})
      : super(key: key);

  final TextEditingController textController;
  final Icon icon;
  final TextInputType textInputType;
  final bool obscureText;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 3,
      shadowColor: Colors.white,
      child: TextFormField(
        controller: textController,
        cursorColor: Colors.black,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            prefixIcon: icon,
            prefixIconColor: Colors.black,
            labelText: textLabel,
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: InputBorder.none),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
