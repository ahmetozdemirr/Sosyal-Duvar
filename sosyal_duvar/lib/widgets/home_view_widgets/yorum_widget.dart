import 'package:flutter/material.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';

class YorumWidget extends StatelessWidget {
  const YorumWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);
  final YorumModel listIndex;
  @override
  Widget build(BuildContext context) {
    return Text(
      listIndex.description.toString(),
      maxLines: 3,
      softWrap: true,
      textAlign: TextAlign.left,
      style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(overflow: TextOverflow.clip,
                color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}
