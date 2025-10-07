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
import 'package:flutter_application_1/pages/bottomnav_page.dart';
import 'package:flutter_application_1/pages/drawer_page.dart';
import 'package:flutter_application_1/pages/example_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/splashscreen_page.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainPage(),
      bindings: [MenuBindings()],
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
    GetPage(
      name: AppRoutes.examplepage,
      page: () => ExamplePage(),
      bindings: [FootballBindings()],
    ),
  ];
}
