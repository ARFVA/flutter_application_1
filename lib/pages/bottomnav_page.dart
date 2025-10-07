import 'package:flutter/material.dart';
import 'package:flutter_application_1/fragment/calculator_fragment.dart';
import 'package:flutter_application_1/fragment/contact_fragment.dart';
import 'package:flutter_application_1/fragment/profile_fragment.dart';
import 'package:flutter_application_1/pages/example_page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/main_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final controller = Get.find<MainController>();

  final List<Widget> pages = [
    CalculatorFragment(),
    ExamplePage(),
    ProfileFragment(),
    ContactFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            backgroundColor: Colors.white,
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
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail),
                label: "contact",
              ),
            ],
          ),
        ));
  }
}
