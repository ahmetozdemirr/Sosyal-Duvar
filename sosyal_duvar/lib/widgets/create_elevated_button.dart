//Butonwidget
import 'package:flutter/material.dart';
import 'package:sosyal_duvar/constants/colors.dart';

class CreateElevatedButton extends StatelessWidget {
  const CreateElevatedButton({
    Key? key,
    required this.butonText,
    required this.onPressed,
    this.backgroundcolor = genelColor,
    this.textColor = kPrimaryColor,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  final String butonText;
  final Function() onPressed;
  final Color backgroundcolor;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundcolor),
        onPressed: onPressed,
        child: Text(
          butonText,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: textColor, fontWeight: fontWeight),
        ));
  }
}
