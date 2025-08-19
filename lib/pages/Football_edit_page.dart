import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/CustomTextField.dart';
import 'package:flutter_application_1/Widget/reusable.dart';
import 'package:flutter_application_1/controllers/Football_edit_Controller.dart';
import 'package:get/get.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final editController = Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    final index = Get.arguments;
    editController.loadPlayer(index);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Player"),
      ),
      body: Padding(
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
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                editController.updatePlayer(index);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
