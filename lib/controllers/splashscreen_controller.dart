import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }
  checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    final saveuser = prefs.getString("username");
    await Future.delayed(Duration(seconds: 2));
    if (saveuser != null && saveuser.isNotEmpty) {
      Get.offAllNamed(AppRoutes.main);
      return;
    }
    Get.offAllNamed(AppRoutes.loginpage);
  }
}