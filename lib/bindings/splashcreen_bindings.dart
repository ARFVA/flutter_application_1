import 'package:flutter_application_1/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashcreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut <SplashscreenController>(() => SplashscreenController());
  }
}