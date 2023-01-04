import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sosyal_duvar/constants/route_constants.dart';
import 'package:sosyal_duvar/service/yorum_service.dart';
import 'package:sosyal_duvar/ui/views/home_view.dart';

class Dene extends StatelessWidget {
  Dene({Key? key}) : super(key: key);
  YorumService service = YorumService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(HomeView());
            },
            child: Text("data")),
      ),
    );
  }
}
