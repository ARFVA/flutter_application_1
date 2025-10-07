import 'package:flutter_application_1/controllers/example_controller.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/controllers/football_edit_controller.dart';
import 'package:get/get.dart';

class ExampleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
    Get.lazyPut <FootballEditControllers>(() => FootballEditControllers());
    Get.lazyPut <Footballcontroller>(() => Footballcontroller());
    Get.lazyPut <ExampleController>(() => ExampleController());
  }
}