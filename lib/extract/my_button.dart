import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.onPressedFunction,
      required this.text,
      required this.buttonColor})
      : super(key: key);

  final void Function()? onPressedFunction;
  final String text;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2, left: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border(
          bottom: const BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
          left: const BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
        ),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        elevation: 3,
        color: buttonColor,
        onPressed: onPressedFunction,
        height: 60,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
