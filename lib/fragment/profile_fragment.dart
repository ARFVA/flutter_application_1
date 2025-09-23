import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/widget/ProfileInfo.dart';
import 'package:flutter_application_1/widget/ReusbaleButton.dart';
import 'package:get/get.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});
  final profilcontoller = Get.find<LoginController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/image/ronaldo.png"),
                  ),
                ),
                SizedBox(height: 20),

                ProfileInfo(title: "Nama", value: "Riffat Arfa Pramana"),
                SizedBox(height: 8),

                ProfileInfo(title: "Absen", value: "33"),
                SizedBox(height: 8),

                ProfileInfo(title: "Kelas", value: "XI PPLG 1"),
                SizedBox(height: 8),

                ProfileInfo(
                  title: "Asal",
                  value: "Prambatan Kidul, Kudus, Jawa Tengah",
                ),
                SizedBox(height: 8),

                ProfileInfo(title: "Hobi", value: "Main Game"),
                SizedBox(height: 16),

                 ReusableButton(
                  text: "Logout",
                  color: Colors.red,
                  onPressed: () {
                  profilcontoller.logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
