import 'package:flutter/material.dart';

class DigerYorumWidget extends StatelessWidget {
  const DigerYorumWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            'diğer yorumları gör...',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
