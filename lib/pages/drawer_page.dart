import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/main_controller.dart';
import 'package:flutter_application_1/fragment/calculator_fragment.dart';
import 'package:flutter_application_1/fragment/football_fragment.dart';
import 'package:flutter_application_1/fragment/profile_fragment.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({super.key});
  final controller = Get.find<MainController>();

  final List<Widget> pages = [
    CalculatorFragment(),
    FootballFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 9, 90, 28),
            foregroundColor: Colors.white,
            title: Text(
              _getTitle(controller.selectedIndex.value),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 0, 
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 9, 90, 28),
                  ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/image/ronaldo.png"),
                    ),
                  ),
                  accountName: const Text(
                    "Riffat Arfa Pramana",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: const Text("riffat@email.com"),
                ),
                ListTile(
                  leading: const Icon(Icons.calculate),
                  title: const Text("Calculator"),
                  onTap: () {
                    controller.changePage(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sports_soccer),
                  title: const Text("Football"),
                  onTap: () {
                    controller.changePage(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    controller.changePage(2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: pages[controller.selectedIndex.value],
          ),
        ));
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Calculator";
      case 1:
        return "Football";
      case 2:
        return "Profile";
      default:
        return "";
    }
  }
}
