import 'package:get/get.dart';
import 'package:sosyal_duvar/ui/binding/home_view_bindings.dart';
import 'package:sosyal_duvar/constants/route_constants.dart';

import 'package:sosyal_duvar/ui/views/home_view.dart';
import 'package:sosyal_duvar/ui/views/yorum_view.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.HomeScreen,
        page: () => HomeView(),
        binding: HomeBindings()),
    GetPage(
        name: Routes.YorumScreen,
        page: () => YorumView(),
        binding: HomeBindings())
  ];
}
