import 'package:flutter_application_1/bindings/calculator_bindings.dart';
import 'package:flutter_application_1/bindings/contact_bindings.dart';
import 'package:flutter_application_1/bindings/football_bindings.dart';
import 'package:flutter_application_1/bindings/football_edit_bindings.dart';
import 'package:flutter_application_1/bindings/login_bindings.dart';
import 'package:flutter_application_1/bindings/menu_bindings.dart';
import 'package:flutter_application_1/bindings/splashcreen_bindings.dart';
import 'package:flutter_application_1/fragment/calculator_fragment.dart';
import 'package:flutter_application_1/fragment/contact_fragment.dart';
import 'package:flutter_application_1/fragment/football_edit_fragment.dart';
import 'package:flutter_application_1/fragment/football_fragment.dart';
import 'package:flutter_application_1/fragment/profile_fragment.dart';
import 'package:flutter_application_1/pages/CalculatorPage.dart';
import 'package:flutter_application_1/pages/drawer_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/splashscreen_page.dart';
import 'package:get/get.dart';
import '../pages/football_page.dart';
import '../pages/football_edit_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainPage(),
      bindings: [MenuBindings()],
    ),
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
      bindings: [CalculatorBindings()],
    ),
    GetPage(
      name: AppRoutes.footballPlayers,
      page: () => FootballPages(),
      bindings: [FootballBindings()],
    ),
    GetPage(
      name: AppRoutes.footballEditPlayers,
      page: () => FootballEditPage(),
      bindings: [FootballEditBindings()],
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.drawer,
      page: () => DrawerPage(),
      bindings: [MenuBindings()],
    ),
    GetPage(
      name: AppRoutes.calculatorfrag,
      page: () => CalculatorFragment(),
      bindings: [CalculatorBindings()],
    ),
    GetPage(
      name: AppRoutes.footballPlayersfrag,
      page: () => FootballFragment(),
      bindings: [FootballBindings()],
    ),
    GetPage(
      name: AppRoutes.footballEditPlayersfrag,
      page: () => FootballEditFragment(),
      bindings: [FootballEditBindings()],
    ),
    GetPage(
      name: AppRoutes.profilefrag,
      page: () => ProfileFragment(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.splashscreenPage,
      page: () => SplashscreenPage(),
      bindings: [SplashcreenBindings()],
    ),
    GetPage(
      name: AppRoutes.loginpage,
      page: () => LoginPages(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.contactfrag,
      page: () => ContactFragment(),
      bindings: [ContactBindings()],
    ),
  ];
}
