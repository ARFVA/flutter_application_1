import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/NotificationController.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:get/get.dart';

class Homefirebase extends StatelessWidget {
  const Homefirebase({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController c = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Home Firebase",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("📩 Last message received:"),
              const SizedBox(height: 10),
              Text(c.lastMessage.value, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              const Divider(),
              const Text(
                "📱 Your FCM Token:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SelectableText(c.token.value, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}