import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sosyal_duvar/constants/colors.dart';
import 'package:sosyal_duvar/constants/route_constants.dart';
import 'package:sosyal_duvar/constants/text_strings.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';
import 'package:sosyal_duvar/service/yorum_service.dart';
import 'package:sosyal_duvar/ui/controller/home_views_controller.dart';
import 'package:sosyal_duvar/widgets/create_elevated_button.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/diger_yorum_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/main_image_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/post_tile_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/profile_card_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/sosyal_yorum_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/yorum_form_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/yorum_tile_widget.dart';
import 'package:sosyal_duvar/widgets/home_view_widgets/yorum_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YorumService service = YorumService();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(appBarTitle),
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back_ios_sharp),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              children: [
                ProfileCardWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 5,
                        child: paylasText(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Butonlar(butonFotoText, butonPaylasText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Yorumlar(),
        ],
      ),
    );
  }

  TextField paylasText() {
    return TextField(
      expands: true,
      maxLines: null,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: genelColor), //<-- SEE HERE
          ),
          hintTextDirection: TextDirection.ltr,
          fillColor: kPrimaryColor,
          filled: true,
          border: OutlineInputBorder(),
          hintText: "Paylaşmak istediğiniz konu hakkında bir şeyler yaz",
          hintStyle: TextStyle(color: kWriteColor)),
    );
  }

  Row Butonlar(String butonFotoText, String butonPaylasText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CreateElevatedButton(
          butonText: butonFotoText,
          onPressed: () {},
          backgroundcolor: kPrimaryColor,
          textColor: kWriteColor,
        ),
        CreateElevatedButton(
          butonText: butonPaylasText,
          onPressed: () {},
        ),
      ],
    );
  }
}

class Yorumlar extends StatelessWidget {
  const Yorumlar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          Get.lazyPut(() => HomeController());
          (_).getYorum();
          return (_).isDataLoading
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    var listIndex = (_).yorumModel[index];

                    return GestureDetector(
                      onTap: () {
                        print("ddd:::: ${(_).yorumModel[index].id}");
                        (_).getPost((_).yorumModel[index].id.toString());
                        Get.toNamed(Routes.YorumScreen);
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Card(
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
                                listIndex: listIndex,
                              ),
                              Expanded(
                                  child: YorumWidget(
                                listIndex: listIndex,
                              )),
                              listIndex.media!.isNotEmpty
                                  ? Expanded(
                                      flex: 5,
                                      child: listIndex.media == null
                                          ? SizedBox.shrink()
                                          : Image.network(
                                              (_)
                                                  .yorumModel[index]
                                                  .media
                                                  .toString(),
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
                                  listIndex: (_).yorumModel[index],
                                ),
                              ),
                              listIndex.comments!.isNotEmpty
                                  ? YorumTileWidget(
                                      listIndex: (_).yorumModel[index],
                                    )
                                  : ListTile(),
                              DigerYorumWidget(),
                              YorumFormWidget(
                                listIndex: (_).yorumModel[index],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
