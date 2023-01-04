import 'package:flutter/material.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';
import 'package:sosyal_duvar/widgets/ITColumnWidgets.dart';

class SosyalYorumWidget extends StatelessWidget {
  const SosyalYorumWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);
  final YorumModel listIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ITColumnWidget(
          icon: Icons.favorite,
          text: listIndex.likeCount.toString(),
        ),
        SizedBox(
          width: 5,
        ),
        ITColumnWidget(
          icon: Icons.stadium_sharp,
          text: listIndex.disLikeCount.toString(),
        ),
        SizedBox(
          width: 5,
        ),
        ITColumnWidget(
          icon: Icons.question_answer,
          text: "1",
        )
      ],
    );
  }
}
