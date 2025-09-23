import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernamController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {

    if (usernamController.text == 'admin' && passwordController.text == '123') {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', usernamController.text.toString());
      Get.snackbar(
        'Login Berhasil!',
        'Selamat datang kembali!',
        backgroundColor: Color.fromARGB(255, 61, 161, 61),
        snackPosition: SnackPosition.TOP,
        colorText: Color( 0xFFFFFFFF),
        margin: EdgeInsets.all(10),
      );
      Get.offAllNamed(AppRoutes.drawer);
    } else {
      Get.snackbar(
        'Login Gagal!',
        'Username atau password salah.',
        backgroundColor: Color.fromARGB(255, 161, 61, 61),
        colorText: Color( 0xFFFFFFFF),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
      );
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.splashscreenPage);
  }
}