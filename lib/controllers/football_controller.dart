import 'package:get/get.dart';
import '../models/player_model.dart';

class Footballcontroller extends GetxController {
  var players = <Player>[
    Player(
      profileImage: 'assets/image/ronaldo.png',
      nama: 'C.Ronaldo',
      posisi: 'Striker',
      nomorPunggung: 7,
    ),
    Player(
      profileImage: 'assets/image/messi.png',
      nama: 'L.Messi',
      posisi: 'Sayap kanan',
      nomorPunggung: 10,
    ),
    Player(
      profileImage: 'assets/image/neymar.png',
      nama: 'Neymar.Jr',
      posisi: 'Sayap kiri',
      nomorPunggung: 10,
    ),
  ].obs;
}