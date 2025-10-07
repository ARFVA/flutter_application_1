import 'package:flutter/material.dart';
import 'package:flutter_application_1/fragment/contact_fragment.dart';
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
    ContactFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 9, 90, 28),
          foregroundColor: Colors.white,
          title: Text(
            _getTitle(controller.selectedIndex.value),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 9, 90, 28),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/image/ronaldo.png"),
                  ),
                ),
                accountName: Text(
                  "Riffat Arfa Pramana",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("riffat@email.com"),
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text("Calculator"),
                onTap: () {
                  controller.changePage(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.sports_soccer),
                title: Text("Football"),
                onTap: () {
                  controller.changePage(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  controller.changePage(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_emergency),
                title: Text("Contact"),
                onTap: () {
                  controller.changePage(3);
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
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Calculator";
      case 1:
        return "Football";
      case 2:
        return "Profile";
      case 3:
        return "Contact";
      default:
        return "";
    }
  }
}
