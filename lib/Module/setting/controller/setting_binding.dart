import 'package:al_3qed/Module/home/controller/home_controller.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:get/get.dart';

class SettingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
    Get.put(HomeController());
  }
}
