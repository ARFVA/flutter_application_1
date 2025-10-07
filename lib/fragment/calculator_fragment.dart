import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/CalculatorController.dart';
import 'package:flutter_application_1/Widget/CustomTextField.dart';
import 'package:flutter_application_1/Widget/reusable.dart';

class CalculatorFragment extends StatelessWidget {
  CalculatorFragment({super.key});
  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Calculator",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  label: "input angka 1",
                  controller: calculatorController.txtAngka1,
                  icon: Icons.looks_one,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: "input angka 2",
                  controller: calculatorController.txtAngka2,
                  icon: Icons.looks_two,
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "+",
                          textColor:  Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromARGB(255, 9, 90, 28),
                          onPressed: () {
                            calculatorController.tambah();
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          text: "-",
                          textColor:  Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromARGB(255, 9, 90, 28),
                          onPressed: () {
                            calculatorController.kurang();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "X",
                          textColor:  Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Color.fromARGB(255, 9, 90, 28),
                          onPressed: () {
                            calculatorController.kali();
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          text: "/",
                          backgroundColor: Color.fromARGB(255, 9, 90, 28),
                          textColor:  Color.fromARGB(255, 255, 255, 255),
                          onPressed: () {
                            calculatorController.bagi();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Obx(() => Text("Hasil ${calculatorController.hasil.value}")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
