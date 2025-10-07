import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/CustomTextField.dart';
import 'package:flutter_application_1/Widget/reusable.dart';
import 'package:flutter_application_1/controllers/football_edit_controller.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:get/get.dart';

class FootballEditFragment extends StatelessWidget {
  FootballEditFragment({super.key});
  final editController = Get.find<FootballEditControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Edit Player",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              label: "Nama",
              controller: editController.namaController,
              icon: Icons.person,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: "Posisi",
              controller: editController.posisiController,
              icon: Icons.sports_soccer,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              label: "Nomor Punggung",
              controller: editController.nomorPunggungController,
              icon: Icons.numbers,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Simpan",
              backgroundColor: const Color.fromARGB(255, 9, 90, 28),
              onPressed: () {
                editController.updatePlayer();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
