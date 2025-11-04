import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/pages/mobile/example_mobile.dart';
import 'package:flutter_application_1/pages/widescreen/example_widescreen.dart';
import 'package:get/get.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});
  final examplecontroller = Get.find<Footballcontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          examplecontroller.updateLayout(constraints);
          return Obx(
            () => examplecontroller.isMobile.value
                ? ExampleMobile()
                : ExampleWidescreen(),
          );
        },
      ),
    );
  }
}
