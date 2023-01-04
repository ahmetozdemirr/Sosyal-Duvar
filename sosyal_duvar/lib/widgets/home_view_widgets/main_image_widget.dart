import 'package:flutter/material.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);
  final YorumModel listIndex;
  @override
  Widget build(BuildContext context) {
    return listIndex.media == null
        ? SizedBox.shrink()
        : Image.network(listIndex.media.toString(),
            fit: BoxFit.cover, width: double.infinity);
  }
}

