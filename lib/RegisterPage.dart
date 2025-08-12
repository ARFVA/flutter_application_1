import 'package:flutter/material.dart';
import 'Widget/CustomTextField.dart';
import 'Widget/reusable.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _gender = "Laki-laki";
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Daftar Akun", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Registrasi",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            CustomTextField(
              label: "Nama Lengkap",
              controller: _namaController,
              icon: Icons.person,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: "Email / Username",
              controller: _emailController,
              icon: Icons.email,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: "Password",
              controller: _passwordController,
              isPassword: true,
              icon: Icons.lock,
            ),
            const SizedBox(height: 16),

            const Text("Jenis Kelamin", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Radio(
                  value: "Laki-laki",
                  groupValue: _gender,
                  onChanged: (val) {
                    setState(() => _gender = val!);
                  },
                ),
                const Text("Laki-laki"),
                Radio(
                  value: "Perempuan",
                  groupValue: _gender,
                  onChanged: (val) {
                    setState(() => _gender = val!);
                  },
                ),
                const Text("Perempuan"),
              ],
            ),
            const SizedBox(height: 16),

            const Text("Tanggal Lahir", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_selectedDate.toLocal()}".split(' ')[0]),
                ElevatedButton.icon(
  onPressed: () async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  },
  icon: const Icon(Icons.calendar_today),
  label: const Text("Pilih Tanggal"),
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    foregroundColor: Colors.black,
    side: const BorderSide(color: Colors.black),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
),

              ],
            ),
            const SizedBox(height: 30),

            CustomButton(
              text: "Daftar",
              textColor: Colors.white,
              backgroundColor: Colors.green,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Registrasi berhasil")),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
