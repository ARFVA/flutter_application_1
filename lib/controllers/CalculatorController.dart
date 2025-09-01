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

  bool _isInputValid() {
    if (txtAngka1.text.trim().isEmpty || txtAngka2.text.trim().isEmpty) {
      hasil.value = "Isi kedua angka terlebih dahulu";
      return false;
    }
    return true;
  }

  void tambah() {
    if (!_isInputValid()) return;
    try {
      int angka1 = int.parse(txtAngka1.text);
      int angka2 = int.parse(txtAngka2.text);
      int result = angka1 + angka2;
      hasil.value = result.toString();
      print('Tambah: $angka1 + $angka2 = $result');
    } catch (e) {
      hasil.value = 'Error';
    }
  }

  void kurang() {
    if (!_isInputValid()) return;
    try {
      int angka1 = int.parse(txtAngka1.text);
      int angka2 = int.parse(txtAngka2.text);
      int result = angka1 - angka2;
      hasil.value = result.toString();
      print('Kurang: $angka1 - $angka2 = $result');
    } catch (e) {
      hasil.value = 'Error';
    }
  }

  void kali() {
    if (!_isInputValid()) return;
    try {
      int angka1 = int.parse(txtAngka1.text);
      int angka2 = int.parse(txtAngka2.text);
      int result = angka1 * angka2;
      hasil.value = result.toString();
      print('Kali: $angka1 * $angka2 = $result');
    } catch (e) {
      hasil.value = 'Error';
    }
  }

  void bagi() {
    if (!_isInputValid()) return;
    try {
      int angka1 = int.parse(txtAngka1.text);
      int angka2 = int.parse(txtAngka2.text);
      if (angka2 == 0) {
        hasil.value = "Tidak bisa dibagi 0";
      } else {
        double result = angka1 / angka2;
        hasil.value = result.toStringAsFixed(2);
        print('Bagi: $angka1 / $angka2 = $result');
      }
    } catch (e) {
      hasil.value = 'Error';
    }
  }

  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
    hasil.value = "0";
  }
}
