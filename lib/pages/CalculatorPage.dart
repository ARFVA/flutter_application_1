import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/CalculatorController.dart';
import 'package:flutter_application_1/Widget/CustomTextField.dart';
import 'package:flutter_application_1/Widget/reusable.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});
  final CalculatorController calculatorController = Get.put(CalculatorController());
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Calculator")),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(label: "input angka 1", controller: calculatorController.txtAngka1, icon: Icons.looks_one),
                SizedBox(height: 16),
                CustomTextField(label: "input angka 2", controller: calculatorController.txtAngka2, icon: Icons.looks_two),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(text: "+", textColor: Colors.blue, onPressed: () {
                          calculatorController.tambah();
                        }),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(text: "-", textColor: Colors.blue, onPressed: () {
                          calculatorController.kurang();
                        }),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(text: "X", textColor: Colors.blue, onPressed: () {
                          calculatorController.kali();
                        }),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(text: "/", textColor: Colors.blue, onPressed: () {
                          calculatorController.bagi();
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // render UI berada di wrap OBX
                Obx(() => Text("Hasil "+calculatorController.hasil.value)),
                SizedBox(height: 16),
                CustomButton(
                 text: "Footbal Players", textColor: Colors.blueAccent, onPressed: () {
              Get.toNamed(AppRoutes.footballPlayers);
            }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}