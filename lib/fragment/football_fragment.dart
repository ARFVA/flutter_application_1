import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/routes/routes.dart';

class FootballFragment extends StatelessWidget {
  FootballFragment({super.key});
  final footballController = Get.find<Footballcontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(player.profileImage),
                  ),
                  title: Text(
                    player.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    '${player.posisi} • #${player.nomorPunggung}',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey[600],
                  ),
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.footballEditPlayersfrag,
                      arguments: index,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
