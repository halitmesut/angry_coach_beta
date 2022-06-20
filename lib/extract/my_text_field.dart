import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.textController,
      required this.icon,
      required this.textInputType,
      required this.obscureText,
      required this.textLabel,
      this.validate})
      : super(key: key);

  final TextEditingController textController;
  final Icon icon;
  final TextInputType textInputType;
  final bool obscureText;
  final String textLabel;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 0,
      shadowColor: Colors.white,
      child: TextFormField(
        controller: textController,
        validator: validate,
        cursorColor: Colors.black,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            prefixIcon: icon,
            labelText: textLabel,
            labelStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30))),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
