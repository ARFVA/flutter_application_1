import 'package:flutter_application_1/controllers/CalculatorController.dart';
import 'package:flutter_application_1/controllers/contact_controller.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/controllers/football_edit_controller.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/controllers/main_controller.dart';
import 'package:get/get.dart';

class MenuBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut <MainController>(() => MainController());
    Get.lazyPut <CalculatorController>(() => CalculatorController());
    Get.lazyPut <FootballEditControllers>(() => FootballEditControllers());
    Get.lazyPut <Footballcontroller>(() => Footballcontroller());
    Get.lazyPut <ContactController>(() => ContactController());
    Get.lazyPut <LoginController>(() => LoginController());
  }
  
}