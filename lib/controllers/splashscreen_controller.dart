import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
@override
void onInit() {
  super.onInit();
  Future.delayed(const Duration(seconds: 2), () {
    checkLoginStatus();
  });
}

  // 🔹 AUTO LOGIN CHECK
Future<void> checkLoginStatus() async {
  await Future.delayed(const Duration(milliseconds: 800));

  final prefs = await SharedPreferences.getInstance();

  final token = prefs.getString("token"); // login biasa
  final googleLogin = prefs.getBool("google_logged_in") ?? false;

  // ✅ Jika login normal
  if (token != null && token.isNotEmpty) {
    print('Auto login (normal) with token: $token');
    Get.offAllNamed(AppRoutes.main);
    return;
  }

  // ✅ Jika login Google
  if (googleLogin == true) {
    print("Auto login (Google)");
    Get.offAllNamed(AppRoutes.main);
    return;
  }

  // ✅ Jika belum login apa pun
  Get.offAllNamed(AppRoutes.loginpage);
}

}