import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/database_helper.dart';
import 'package:flutter_application_1/widget/ReusableTextButton.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  
  final TextEditingController nameController = TextEditingController();
  final names = <String>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

   Future<void> updateName(int index, String newName) async {
    final oldName = names[index];
    if (newName.trim().isEmpty) return;
    await _dbHelper.updateName(oldName, newName.trim());
    fetchNames();
  }

  Future<void> deleteName(int index) async {
    final name = names[index];
    await _dbHelper.deleteName(name);
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data.map((e) => e['name'] as String).toList();
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }
  
  Future<void> showEditDialog(BuildContext context, int index) async {
    final oldName = names[index];
    final controller = TextEditingController(text: oldName);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Nama'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nama'),
        ),
        actions: [
          ReusableTextButton(
            text: 'Batal',
            onPressed: () => Navigator.pop(context),
            color: Color.fromARGB(255, 165, 34, 24),
            textColor: Colors.white,
          ),
          ReusableTextButton(
            text: 'Update',
            onPressed: () => Navigator.pop(context, controller.text),
            color: Color.fromARGB(255, 9, 90, 28),
            textColor: Colors.white,
          ),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty && result != oldName) {
      updateName(index, result.trim());
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
