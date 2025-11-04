import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_application_1/network/client_network.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  final usernamController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var googleName = "".obs;
  var googleEmail = "".obs;
  var googlePhoto = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadGoogleData();
  }

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

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // ✅ Setelah login sukses
      final prefs = await SharedPreferences.getInstance();

      googleName.value = googleUser.displayName ?? "";
      googleEmail.value = googleUser.email;
      googlePhoto.value = googleUser.photoUrl ?? "";

      await prefs.setString("google_name", googleName.value);
      await prefs.setString("google_email", googleEmail.value);
      await prefs.setString("google_photo", googlePhoto.value);
      await prefs.setBool("google_logged_in", true);

      Get.snackbar(
        'Sukses',
        'Login Google sukses!',
        backgroundColor: const Color.fromARGB(255, 69, 161, 61),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );

      Get.offAllNamed(AppRoutes.main);
    } catch (e) {
      print("Google Sign-In Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> loadGoogleData() async {
    final prefs = await SharedPreferences.getInstance();

    googleName.value = prefs.getString("google_name") ?? "";
    googleEmail.value = prefs.getString("google_email") ?? "";
    googlePhoto.value = prefs.getString("google_photo") ?? "";
  }

  Future<void> logout() async {
    Get.defaultDialog(
      title: "Konfirmasi",
      titleStyle: const TextStyle(
        color: Color.fromARGB(255, 9, 90, 28),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      middleText: "Apakah kamu yakin ingin Log out? 😢",
      middleTextStyle: const TextStyle(color: Colors.black87, fontSize: 16),
      backgroundColor: Colors.white,
      textCancel: "Batal",
      textConfirm: "Ya, Logout",
      confirmTextColor: Colors.white,
      cancelTextColor: const Color.fromARGB(255, 9, 90, 28),
      buttonColor: const Color.fromARGB(255, 9, 90, 28),
      radius: 12,
      onConfirm: () async {
        final prefs = await SharedPreferences.getInstance();

        // ✅ Cek apakah login via Google
        final isGoogleLogin = prefs.getBool("google_logged_in") ?? false;

        if (isGoogleLogin) {
          // ✅ Logout Google
          await GoogleSignIn().signOut();
          await FirebaseAuth.instance.signOut();
        }

        // ✅ Bersihkan semua data login
        await prefs.clear();

        // ✅ Kembali ke login
        Get.offAllNamed(AppRoutes.loginpage);

        Get.snackbar(
          'Logout',
          'Berhasil',
          backgroundColor: const Color.fromARGB(255, 161, 61, 61),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );
      },
    );
  }
}
