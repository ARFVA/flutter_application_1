import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'RegisterPage.dart';
import 'Widget/CustomTextField.dart';
import 'Widget/reusable.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Login", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Selamat Datang",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Silakan login menggunakan akun Anda",
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/image/loq.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: "Email / Username",
                controller: controllerUsername,
                icon: Icons.email,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: "Password",
                controller: controllerPassword,
                isPassword: true,
                icon: Icons.lock,
              ),
              const SizedBox(height: 16),

              Center(
  child: TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        ),
      );
    },
    child: const Text(
      "Belum punya akun? Daftar di sini",
      style: TextStyle(
        fontStyle: FontStyle.italic, 
      ),
    ),
  ),
),
              Container(
                child: CustomButton(
                  text: "Login",
                  textColor: Colors.white,
                  onPressed: () {
                    if (controllerUsername.text == "admin" && controllerPassword.text == "password") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Login Sukses!",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green.shade600,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                      setState(() {
                        statusLogin = "";
                      });
                    } else {
                      setState(() {
                        statusLogin = "Gagal login: username/password salah";
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 10),
              Text(
                statusLogin,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}