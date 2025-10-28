import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_application_1/network/client_network.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  final usernamController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  login() async {
    isLoading.value = true;
    print('[DEBUG] Mulai proses login...');
    print('Username: ${usernamController.text.trim()}');
    print('Password: ${passwordController.text.trim()}');

    try {
      final response = await ClientNetwork.postRequest('latihan/login', {
        'username': usernamController.text.trim(),
        'password': passwordController.text.trim(),
      });

      print('[DEBUG] Response Status Code: ${response.statusCode}');
      print('[DEBUG] Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == true) {
          print('[DEBUG] Login berhasil, status = true');

          final loginData = LoginModel.fromJson(data);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', loginData.token);
          await prefs.setString('username', usernamController.text.trim());

          print('[DEBUG] Token disimpan: ${loginData.token}');
          print('[DEBUG] Username disimpan: ${usernamController.text.trim()}');

          Get.snackbar(
            'Login Berhasil!',
            loginData.message,
            backgroundColor: const Color.fromARGB(255, 61, 161, 61),
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
          );

          Get.offAllNamed(AppRoutes.main);
        } else {
          print('[DEBUG] Login gagal, status = false');
          print('[DEBUG] Pesan dari server: ${data['message']}');

          Get.snackbar(
            'Login Gagal!',
            data['message'] ?? 'Username atau password salah.',
            backgroundColor: const Color.fromARGB(255, 161, 61, 61),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(10),
          );
        }
      } else {
        print('[DEBUG] Server error, kode: ${response.statusCode}');

        Get.snackbar(
          'Error',
          'Server error: ${response.statusCode}',
          backgroundColor: const Color.fromARGB(255, 161, 61, 61),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );
      }
    } catch (e) {
      print('[DEBUG] Terjadi error saat login: $e');

      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: const Color.fromARGB(255, 161, 61, 61),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
    } 
      isLoading.value = false;
      print('[DEBUG] Selesai proses login.');
  }

  logout() async {
    print('[DEBUG] Logout dimulai...');
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    print('[DEBUG] SharedPreferences dibersihkan.');
    Get.offAllNamed(AppRoutes.splashscreenPage);
    print('[DEBUG] Berhasil logout, dialihkan ke splashscreen.');
  }
}
