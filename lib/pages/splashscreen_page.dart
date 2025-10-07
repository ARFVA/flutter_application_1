import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final splashcontroller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(
              image: AssetImage("assets/image/loq.png"),
              width: 200,
              height: 200,
            ),
             SizedBox(height: 20),
             CircularProgressIndicator(
              strokeWidth: 3,
              color: Color.fromARGB(255, 9, 90, 28),
            ),
          ],
        ),
      ),
    );
  }
}
