import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';

class FootballEditControllers extends GetxController {
  final footballController = Get.find<Footballcontroller>();

  final namaController = TextEditingController();
  final posisiController = TextEditingController();
  final nomorPunggungController = TextEditingController();

  late int index;
  late Footballcontroller footballcontroller;

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments as int;
    print("Selected edit data index: $index");
    final player = footballController.players[index];
    namaController.text = player.nama;
    posisiController.text = player.posisi;
    nomorPunggungController.text = player.nomorPunggung.toString();
    print("Selected player: ${player.nama}");
  }

  void updatePlayer() {
    final updatedPlayer = Player(
      profileImage: footballController.players[index].profileImage,
      nama: namaController.text,
      posisi: posisiController.text,
      nomorPunggung: int.tryParse(nomorPunggungController.text) ?? 0,
    );
    footballController.players[index] = updatedPlayer;
  }

  @override
  void onClose() {
    namaController.dispose();
    posisiController.dispose();
    nomorPunggungController.dispose();
    super.onClose();
  }
}
