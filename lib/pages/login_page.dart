import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:flutter_application_1/widget/ReusableTextField.dart';
import 'package:flutter_application_1/widget/reusable.dart';
import 'package:get/instance_manager.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Login",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 9, 90, 28),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              Icon(Icons.person, size: 120, color: Color.fromARGB(255, 9, 90, 28)),
              ReusableText(
                text: "Welcome Back!",
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 30),
              ReusableTextField(
                label: "Username",
                controller: loginController.usernamController,
              ),
              SizedBox(height: 16),
              ReusableTextField(
                label: "Password",
                controller: loginController.passwordController,
                isPassword: true,
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Login',
                backgroundColor: Color.fromARGB(255, 9, 90, 28),
                onPressed: () {
                  loginController.login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
