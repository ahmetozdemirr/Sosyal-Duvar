//YorumWidget
import 'package:flutter/material.dart';
import 'package:sosyal_duvar/constants/colors.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';

class YorumFormWidget extends StatelessWidget {
  const YorumFormWidget({
    Key? key,
    required this.listIndex,
  }) : super(key: key);
  final YorumModel listIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: genelColor, width: 2)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: SizedBox(
                height: 50,
                width: 60,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCyrbpoFgqkoe2iOgr5KCf8jrt5nqLz2rZkZEgj-c7Is-j39FLqo4mYZcdODvfT4XimlE&usqp=CAU")),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Konu hakkında bir şeyler yaz..',
                  hintStyle: TextStyle(color: kWriteColor)),
            ),
          )
        ],
      ),
    );
  }
}
