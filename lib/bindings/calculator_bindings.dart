import 'package:flutter_application_1/controllers/CalculatorController.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/controllers/football_edit_controller.dart';
import 'package:flutter_application_1/controllers/main_controller.dart';
import 'package:get/instance_manager.dart';

class CalculatorBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut <FootballEditControllers>(() => FootballEditControllers());
    Get.lazyPut <MainController>(() => MainController());
    Get.lazyPut <Footballcontroller>(() => Footballcontroller());
    Get.lazyPut <CalculatorController>(() => CalculatorController());
  }
  
}