import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '';
  double firstNumber = 0;
  String operation = '';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        display = '';
        firstNumber = 0;
        operation = '';
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        firstNumber = double.parse(display);
        operation = value;
        display = '';
       } else if (value == '=') {
        double secondNumber = double.parse(display);
        double result = 0;

        switch (operation) {
          case '+':
            result = firstNumber + secondNumber;
            break;
          case '-':
            result = firstNumber - secondNumber;
            break;
          case '×':
            result = firstNumber * secondNumber;
            break;
          case '÷':
            result = secondNumber != 0 ? firstNumber / secondNumber : 0;
            break;
        }

        display = result.toString();
      } else {
        display += value;
      }
    });
  }

  Widget buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[800],
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () => onButtonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Kalkulator')),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              display,
              style: const TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('÷', color: Colors.orange),
                ]),
                Row(children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('×', color: Colors.orange),
                ]),
                Row(children: [
                  buildButton('3'),
                  buildButton('2'),
                  buildButton('1'),
                  buildButton('-', color: Colors.orange),
                ]),
                Row(children: [
                  buildButton('0'),
                  buildButton('C', color: Colors.red),
                  buildButton('=', color: Colors.green),
                  buildButton('+', color: Colors.orange),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

