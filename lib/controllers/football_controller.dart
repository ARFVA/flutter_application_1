import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';

class Footballcontroller extends GetxController {
  var players = <Player>[
    Player(
      profileImage: 'assets/image/ronaldo.png',
      nama: 'C.Ronaldo',
      posisi: 'ST',
      nomorPunggung: 7,
    ),
    Player(
      profileImage: 'assets/image/messi.png',
      nama: 'L.Messi',
      posisi: 'RW',
      nomorPunggung: 10,
    ),
    Player(
      profileImage: 'assets/image/neymar.png',
      nama: 'Neymar.Jr',
      posisi: 'LW',
      nomorPunggung: 10,
    ),
  ].obs;
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}