import 'package:flutter_application_1/controllers/premiere_table_controller.dart';
import 'package:get/get.dart';

class PremiereBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PremiereTableController());
  }
}