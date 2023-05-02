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
  String num1 = "";
  String num2 = "";
  String result = "0";
  String operation = "+";

  final List<String> operatorList = ["+", "-", "/", "*"];

  // text editting controllers
  late final TextEditingController _num1Controller;
  late final TextEditingController _num2Controller;

  @override
  void initState() {
    _num1Controller = TextEditingController();
    _num2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  void resetNumbers() {
    setState(() {
      _num1Controller.text = "";
      _num2Controller.text = "";
      result = "0";
    });
  }

  void calculate() {
    switch (operation) {
      case "+":
        setState(() {
          result = (int.parse(_num1Controller.text) +
                  int.parse(_num2Controller.text))
              .toString();
        });
        break;
      case "-":
        setState(() {
          result = (int.parse(_num1Controller.text) -
                  int.parse(_num2Controller.text))
              .toString();
        });
        break;
      case "/":
        setState(() {
          result = (int.parse(_num1Controller.text) /
                  int.parse(_num2Controller.text))
              .toString();
        });
        break;
      case "*":
        setState(() {
          result = (int.parse(_num1Controller.text) *
                  int.parse(_num2Controller.text))
              .toString();
        });
    }
  }

  void setOperator(String operator) {
    setState(() {
      operation = operator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Simple Flutter Calculator"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _num1Controller,
                decoration: const InputDecoration(
                    hintText: "e.g 10",
                    labelText: "Enter First Number",
                    labelStyle: TextStyle(color: Colors.redAccent)),
                enableSuggestions: false,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Operator: $operation",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: operatorList.map((operator) {
                  return OutlinedButton(
                    onPressed: () {
                      setOperator(operator);
                    },
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.red),
                    ),
                    child: Text(operator),
                  );
                }).toList(),
              ),
              TextField(
                controller: _num2Controller,
                decoration: const InputDecoration(
                    hintText: "e.g 10",
                    labelText: "Enter Second Number",
                    labelStyle: TextStyle(color: Colors.redAccent)),
                enableSuggestions: false,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {
                        calculate();
                      },
                      style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.red),
                      ),
                      child: const Text(
                        "=",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Results: $result",
                  style: const TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
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
