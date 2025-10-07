import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/contact_controller.dart';
import 'package:flutter_application_1/widget/ReusableText.dart';
import 'package:flutter_application_1/widget/ReusableTextField.dart';
import 'package:flutter_application_1/widget/ReusableIconButton.dart';
import 'package:get/get.dart';

class ContactFragment extends StatelessWidget {
  ContactFragment({super.key});
  final contactController = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Contact List",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 90, 28),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableTextField(
                    label: "Nama",
                    controller: contactController.nameController,
                  ),
                ),
                SizedBox(width: 12),
                ReusableIconButton(
                  icon: Icons.save,
                  color: Color.fromARGB(255, 9, 90, 28),
                  onPressed: () {
                    contactController.addName();
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: contactController.names.length,
                  itemBuilder: (context, index) {
                    final name = contactController.names[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 9, 90, 28),
                          width: 1.2,
                        ),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: ReusableText(text: name, fontSize: 16),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ReusableIconButton(
                              icon: Icons.edit,
                              color:Color.fromARGB(255, 13, 85, 144),
                              onPressed: () {
                                contactController.showEditDialog(context, index);
                              },
                            ),
                            ReusableIconButton(
                              icon: Icons.delete,
                              color:Color.fromARGB(255, 165, 34, 24),
                              onPressed: () {
                                contactController.deleteName(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
