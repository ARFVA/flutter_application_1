import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/premiere_table_controller.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:get/get.dart';

class PremiereTablePage extends StatelessWidget {
  PremiereTablePage({super.key});
  final controller = Get.find<PremiereTableController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Premiere League Table",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () {
              return controller.fetchPremierLeagueTable();
            },
            child: ListView.builder(
              itemCount: controller.standing.length,
              itemBuilder: (context, index) {
                final team = controller.standing[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.strBadge),
                    ),
                    title: Text(team.strTeam),
                    subtitle: Text(
                      "Played: ${team.intPlayed} W: ${team.intWin} D: ${team.intDraw} L: ${team.intLoss} Point: ${team.intPoints}",
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
