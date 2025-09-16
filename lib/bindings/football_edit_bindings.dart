import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/controllers/football_edit_controller.dart';
import 'package:get/get.dart';

class FootballEditBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut <FootballEditControllers>(() => FootballEditControllers());
    Get.lazyPut <Footballcontroller>(() => Footballcontroller());
  }
  
}