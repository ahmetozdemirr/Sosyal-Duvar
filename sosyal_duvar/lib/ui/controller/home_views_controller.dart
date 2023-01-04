import 'dart:async';

import 'package:get/get.dart';
import 'package:sosyal_duvar/models/yorum_model.dart';
import 'package:sosyal_duvar/service/yorum_service.dart';

class HomeController extends GetxController {
  YorumService yorumService = YorumService();
  //List<YorumModel> yorumModel;
  List<YorumModel> yorumModel = [];
  bool isDataLoading = false;
  YorumModel? yorum;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getYorum();
    // Timer.periodic(Duration(seconds: 2), (timer) => getPost());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changeLoading() {
    isDataLoading = !isDataLoading;
  }

  getPost(String id) async {
    yorum = (await yorumService.getPost(id))!;
    print("yoeum::: ${yorum?.authorId}");
  }

  getYorum() async {
    changeLoading();
    yorumModel = await yorumService.getYorum();
    update();
    changeLoading();
  }
}
