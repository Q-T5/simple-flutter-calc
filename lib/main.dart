import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Simple Flutter Calculator",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num1 = 0;
  int num2 = 0;
  int results = 0;
  String operation = "+";

  void resetNumbers() {
    setState(() {
      num1 = 0;
      num2 = 0;
    });
  }

  void calculate(String operator) {
    switch (operation) {
      case "+":
        setState(() {
          results = num1 + num2;
        });
        break;
      case "-":
        setState(() {
          results = num1 - num2;
        });
        break;
      case "/":
        setState(() {
          results = (num1 / num2) as int;
        });
        break;
      case "*":
        setState(() {
          results = num1 * num2;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Flutter Calculator"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text("my data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resetNumbers();
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
