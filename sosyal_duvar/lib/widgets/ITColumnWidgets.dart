import 'package:flutter/material.dart';
import 'package:sosyal_duvar/constants/colors.dart';

class ITColumnWidget extends StatelessWidget {
  const ITColumnWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: genelColor,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
