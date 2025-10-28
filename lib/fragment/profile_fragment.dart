import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/reusable.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/widget/ProfileInfo.dart';
import 'package:flutter_application_1/widget/ReusableProfileCard.dart';
import 'package:flutter_application_1/widget/ReusableDialog.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:get/get.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});
  final profilcontoller = Get.find<LoginController>();

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
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: ReusableProfileCard(
            imagePath: "assets/image/ronaldo.png",
            infoWidgets: [
              ProfileInfo(title: "Nama", value: "Riffat Arfa Pramana"),
              SizedBox(height: 8),
              ProfileInfo(title: "Absen", value: "33"),
              SizedBox(height: 8),
              ProfileInfo(title: "Kelas", value: "XI PPLG 1"),
              SizedBox(height: 8),
              ProfileInfo(title: "Asal", value: "Prambatan Kidul, Kudus, Jawa Tengah"),
              SizedBox(height: 8),
              ProfileInfo(title: "Hobi", value: "Main Game"),
            ],
            actionWidget: CustomButton(
              text: "Logout",
              backgroundColor: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReusableDialog(
                      title: 'Konfirmasi Logout',
                      content: Text('Apakah Anda yakin ingin keluar?'),
                      onConfirm: () {
                        profilcontoller.logout();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
