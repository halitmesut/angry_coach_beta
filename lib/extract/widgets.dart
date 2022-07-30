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
                leftInput.toStringAsFixed(1),
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
        color: const Color.fromARGB(255, 230, 230, 230),
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

// ignore: must_be_immutable
class IconAndText extends StatelessWidget {
  IconAndText(
      {Key? key,
      required this.imagesAssetPath,
      required this.text,
      required this.containersChild})
      : super(key: key);
  late String imagesAssetPath;
  late String text;
  late Widget containersChild;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Center(child: containersChild),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagesAssetPath),
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingsButton extends StatelessWidget {
  late String title;
  late Widget destinationScreenWidgetName;

  SettingsButton(
      {Key? key,
      required this.title,
      required this.destinationScreenWidgetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => destinationScreenWidgetName));
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
                  color: Colors.black),
            ),
            Expanded(
              child: Container(
                height: 20,
                color: const Color.fromARGB(2, 0, 0, 0),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
