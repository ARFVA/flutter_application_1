import 'package:flutter_application_1/fragment/calculator_fragment.dart';
import 'package:flutter_application_1/fragment/football_edit_fragment.dart';
import 'package:flutter_application_1/fragment/football_fragment.dart';
import 'package:flutter_application_1/fragment/profile_fragment.dart';
import 'package:flutter_application_1/pages/CalculatorPage.dart';
import 'package:flutter_application_1/pages/drawer_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:get/get.dart';
import '../pages/football_page.dart';
import '../pages/football_edit_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.main, page: () => MainPage()),
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPages()),
    GetPage(name: AppRoutes.footballEditPlayers,page: () => FootballEditPage(),),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.drawer, page: () => DrawerPage()),
    GetPage(name: AppRoutes.calculatorfrag, page: () => CalculatorFragment()),
    GetPage(name: AppRoutes.footballPlayersfrag, page: () => FootballFragment()),
    GetPage(name: AppRoutes.footballEditPlayersfrag,page: () => FootballEditFragment(),),
    GetPage(name: AppRoutes.profilefrag, page: () => const ProfileFragment()),
  ];
}
