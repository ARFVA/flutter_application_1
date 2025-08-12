import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('CalculatorController initialized');
  }
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasil = "0".obs;

  void tambah() {
    try {
      int angka1 = int.tryParse(txtAngka1.text) ?? 0;
      int angka2 = int.tryParse(txtAngka2.text) ?? 0;
      int result = angka1 + angka2;
      hasil.value = result.toString();
      print('Tambah: $angka1 + $angka2 = $result');
    } catch (e) {
      print('Error in tambah: $e');
      hasil.value = 'Error';
    }
  }

  void kurang() {
    try {
      int angka1 = int.tryParse(txtAngka1.text) ?? 0;
      int angka2 = int.tryParse(txtAngka2.text) ?? 0;
      int result = angka1 - angka2;
      hasil.value = result.toString();
      print('Kurang: $angka1 - $angka2 = $result');
    } catch (e) {
      print('Error in kurang: $e');
      hasil.value = 'Error';
    }
  }

  void kali() {
    try {
      int angka1 = int.tryParse(txtAngka1.text) ?? 0;
      int angka2 = int.tryParse(txtAngka2.text) ?? 0;
      int result = angka1 * angka2;
      hasil.value = result.toString();
      print('Kali: $angka1 * $angka2 = $result');
    } catch (e) {
      print('Error in kali: $e');
      hasil.value = 'Error';
    }
  }

  void bagi() {
    try {
      int angka1 = int.tryParse(txtAngka1.text) ?? 0;
      int angka2 = int.tryParse(txtAngka2.text) ?? 1;
      if (angka2 == 0) {
        hasil.value = "Tidak bisa dibagi 0";
        print('Bagi: $angka1 / $angka2 = Tidak bisa dibagi 0');
      } else {
        double result = angka1 / angka2;
        hasil.value = result.toStringAsFixed(2);
        print('Bagi: $angka1 / $angka2 = $result');
      }
    } catch (e) {
      print('Error in bagi: $e');
      hasil.value = 'Error';
    }
  }

  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
    hasil.value = "0";
  }
}