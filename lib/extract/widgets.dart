import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WideListBottomItem extends StatelessWidget {
  WideListBottomItem(
      {Key? key,
      required this.leftTitle,
      required this.middleTitle,
      required this.rightTitle,
      required this.leftInput,
      required this.middleInput,
      required this.rightInput})
      : super(key: key);

  late String leftTitle;
  late String middleTitle;
  late String rightTitle;
  late double leftInput;
  late double middleInput;
  late double rightInput;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(leftTitle),
              Text(
                leftInput.toString(),
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(middleTitle),
              Text(
                middleInput.toString(),
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rightTitle),
              Text(
                rightInput.toString(),
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class NormalListItem extends StatelessWidget {
  late String textInput;
  late IconData iconData;
  late Color iconColors;
  late double topLeftCornerRadius;
  late double topRightCornerRadius;
  late double bottomLeftCornerRadius;
  late double bottomRightCornerRadius;

  NormalListItem({
    Key? key,
    required this.textInput,
    required this.iconData,
    required this.iconColors,
    required this.topLeftCornerRadius,
    required this.topRightCornerRadius,
    required this.bottomLeftCornerRadius,
    required this.bottomRightCornerRadius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftCornerRadius),
            topRight: Radius.circular(topRightCornerRadius),
            bottomLeft: Radius.circular(bottomLeftCornerRadius),
            bottomRight: Radius.circular(bottomRightCornerRadius)),
      ),
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Icon(iconData, color: iconColors),
          const SizedBox(width: 30),
          Text(textInput, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class iconAndText extends StatelessWidget {
  iconAndText({required this.imagesAssetPath, required this.text});
  late String imagesAssetPath;
  late String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imagesAssetPath),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
