import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_api_controller.dart';
import 'package:flutter_application_1/widget/GoogleSignIn.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:flutter_application_1/widget/ReusableTextField.dart';
import 'package:flutter_application_1/widget/reusable.dart';

class LoginApiPage extends StatelessWidget {
  const LoginApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Inisialisasi controller di halaman login, bukan di main.dart
    final loginController = Get.find<LoginApiController>();

    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(
          text: "Login",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 15),
              const Icon(
                Icons.person,
                size: 120,
                color: Color.fromARGB(255, 9, 90, 28),
              ),
              const SizedBox(height: 12),
              const ReusableText(
                text: "Welcome Back!",
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 30),
              ReusableTextField(
                label: "Username",
                controller: loginController.usernamController,
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
              ReusableTextField(
                label: "Password",
                controller: loginController.passwordController,
                isPassword: true,
                icon: Icons.lock,
              ),
              const SizedBox(height: 18),
              Obx(() {
                if (loginController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    CustomButton(
                      text: 'Login',
                      backgroundColor: const Color.fromARGB(255, 9, 90, 28),
                      onPressed: loginController.login,
                    ),
                    const SizedBox(height: 12),
                    GoogleSignInButton(
                      onPressed: loginController.loginWithGoogle,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
