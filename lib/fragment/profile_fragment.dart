import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_api_controller.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:flutter_application_1/widget/ReusbaleButton.dart';

import 'package:get/get.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});

  final controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Profile",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ GOOGLE PHOTO
              CircleAvatar(
                radius: 50,
                backgroundImage: controller.googlePhoto.value.isEmpty
                    ? AssetImage("assets/default.png")
                    : NetworkImage(controller.googlePhoto.value)
                        as ImageProvider,
              ),

              SizedBox(height: 16),

              // ✅ GOOGLE NAME
              Text(
                controller.googleName.value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              // ✅ GOOGLE EMAIL
              Text(
                controller.googleEmail.value,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 24),
              ReusableButton(text: 'Logout', color: Colors.red, onPressed: controller.logout)
            ],
          );
        }),
      ),
    );
  }
}