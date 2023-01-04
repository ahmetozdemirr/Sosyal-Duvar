import 'package:flutter/material.dart';
import 'package:sosyal_duvar/constants/colors.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';
import 'package:sosyal_duvar/widgets/ITColumnWidgets.dart';

class YorumTileWidget extends StatelessWidget {
  YorumTileWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);
  YorumModel listIndex;
  @override
  Widget build(BuildContext context) {
    return listIndex.comments!.isNotEmpty
        ? ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                  listIndex.comments![0].authorProfileImage.toString()),
            ),
            trailing: InkWell(
              onTap: () {
                print(listIndex.comments.toString());
              },
              child: const Icon(
                Icons.delete,
                color: genelColor,
              ),
            ),
            title: Text(
              listIndex.comments![0].authorName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listIndex.comments![0].description.toString(),
                  maxLines: 2,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    ITColumnWidget(
                      icon: Icons.favorite,
                      text: listIndex.likeCount.toString(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ITColumnWidget(
                      icon: Icons.arrow_downward,
                      text: listIndex.disLikeCount.toString(),
                    ),
                  ],
                ),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
