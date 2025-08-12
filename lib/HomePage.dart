import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    final String text1 = _controller1.text;
    final String text2 = _controller2.text;

    if (text1.isEmpty || text2.isEmpty) {
      setState(() {
        _result = 'Tolong isi keuda angka';
      });
      return;
    }

    final double num1 = double.tryParse(text1) ?? 0;
    final double num2 = double.tryParse(text2) ?? 0;
    double resultValue;

    switch (operator) {
      case '+':
        resultValue = num1 + num2;
        break;
      case '-':
        resultValue = num1 - num2;
        break;
      case '×':
        resultValue = num1 * num2;
        break;
      case '÷':
        if (num2 == 0) {
          setState(() {
            _result = 'Tidak bisa dibagi 0';
          });
          return;
        }
        resultValue = num1 / num2;
        break;
      default:
        resultValue = 0;
    }

    setState(() {
      _result = 'Hasil: $resultValue';
    });
  }

  void _reset() {
    _controller1.clear();
    _controller2.clear();
    setState(() {
      _result = '';
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator LOQ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka 1',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka 2',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calculate('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => _calculate('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => _calculate('×'), child: const Text('×')),
                ElevatedButton(onPressed: () => _calculate('÷'), child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}