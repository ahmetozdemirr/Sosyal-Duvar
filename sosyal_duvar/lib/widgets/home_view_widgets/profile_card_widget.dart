import 'package:flutter/material.dart';
import 'package:sosyal_duvar/constants/colors.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: genelColor,
        ),
      ),
      color: kPrimaryColor,
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.lime,
          backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCyrbpoFgqkoe2iOgr5KCf8jrt5nqLz2rZkZEgj-c7Is-j39FLqo4mYZcdODvfT4XimlE&usqp=CAU"),
        ),
        title: Text(
          "Faruk Topal",
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
              "Gönderi 25",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.dnd_forwardslash,
              color: genelColor,
            ),
            Text(
              "Yorum 10",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
