import 'package:flutter_application_1/pages/CalculatorPage.dart';
import 'package:get/get.dart';
import '../pages/football_page.dart';
import '../pages/football_edit_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPages()),
    GetPage(name: AppRoutes.footballEditPlayers, page: () => FootballEditPage()),
  ];
}
