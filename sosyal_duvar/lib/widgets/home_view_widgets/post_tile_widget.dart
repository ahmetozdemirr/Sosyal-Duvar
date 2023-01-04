import 'package:flutter/material.dart';
import 'package:sosyal_duvar/constants/colors.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';

class PostTileWidget extends StatelessWidget {
  const PostTileWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);
  final YorumModel listIndex;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: listIndex.authorProfileImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network('${listIndex.authorProfileImage}'),
            )
          : Icon(Icons.person),
      title: Text(
        listIndex.authorName.toString(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.aspect_ratio,
            color: genelColor,
          ),
          Text(
            listIndex.createdAt.toString(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
