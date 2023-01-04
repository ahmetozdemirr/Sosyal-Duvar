import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sosyal_duvar/constants/colors.dart';
import 'package:sosyal_duvar/constants/text_strings.dart';
import 'package:sosyal_duvar/ui/controller/home_views_controller.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/diger_yorum_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/post_tile_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/sosyal_yorum_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/yorum_form_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/yorum_tile_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/yorum_widget.dart';

class YorumView extends GetView {
  const YorumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: Text(appBarTitle),
          automaticallyImplyLeading: true,
          leading: Icon(Icons.arrow_back_ios_sharp),
          elevation: 0,
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (_) {
              Get.lazyPut(() => HomeController());
              // (_).getPost(3);
              //  (_).yorum!.authorName.toString()
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: genelColor)),
                color: kPrimaryColor,
                elevation: 5,
                child: /*SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: */
                    Column(
                  children: [
                    PostTileWidget(
                      listIndex: (_).yorum!,
                    ),
                    Expanded(
                        child: YorumWidget(
                      listIndex: (_).yorum!,
                    )),
                    (_).yorum!.media!.isNotEmpty
                        ? Expanded(
                            flex: 5,
                            child: (_).yorum!.media == null
                                ? SizedBox.shrink()
                                : Image.network((_).yorum!.media.toString(),
                                    fit: BoxFit.cover,
                                    width: double
                                        .infinity), /*MainImageWidget(
                                        listIndex: (_).yorumModel[index],
                                      ),*/
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: SosyalYorumWidget(
                        listIndex: (_).yorum!,
                      ),
                    ),
                    (_).yorum!.comments!.isNotEmpty
                        ? YorumTileWidget(
                            listIndex: (_).yorum!,
                          )
                        : ListTile(),
                    DigerYorumWidget(),
                    YorumFormWidget(
                      listIndex: (_).yorum!,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            }));
  }
}
