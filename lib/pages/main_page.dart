import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/football_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/main_controller.dart';
import 'package:flutter_application_1/pages/CalculatorPage.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final controller = Get.find<MainController>();

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPages(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            selectedItemColor: const Color.fromARGB(255, 9, 90, 28),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: "Calculator",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: "Football",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ));
  }
}
