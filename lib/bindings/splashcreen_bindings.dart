import 'package:flutter_application_1/controllers/login_api_controller.dart';
import 'package:flutter_application_1/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashcreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut <SplashscreenController>(() => SplashscreenController());
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}