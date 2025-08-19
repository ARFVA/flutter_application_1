import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/football_controller.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  Get.put(Footballcontroller());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/main",
      getPages: [
        GetPage(name: "/main", page: () => MainPage()),
      ],
    );
  }
}
