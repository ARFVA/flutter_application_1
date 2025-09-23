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
    await Future.delayed(Duration(seconds: 5));
    if(saveuser !=null){
      Get.offAllNamed(AppRoutes.loginpage);
    }
    else{
      Get.offAllNamed(AppRoutes.loginpage);
    }
  }
}