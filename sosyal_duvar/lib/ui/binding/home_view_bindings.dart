import 'package:get/get.dart';
import 'package:sosyal_duvar/ui/controller/home_views_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
   
  }
}
