import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class ExampleMobile extends StatelessWidget {
  ExampleMobile({super.key});
  final footballController = Get.find<Footballcontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Football Mobile",
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
                  isThreeLine: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(player.profileImage),
                  ),
                  title: ReusableText(
                    text: player.nama,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: ReusableText(
                    text:
                        "Posisi: ${player.posisi}\nNomor Punggung: ${player.nomorPunggung}",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
