import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = "";
  String operador = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        children: [
          _buildDisplay(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      alignment: AlignmentDirectional.centerEnd,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
        ),
      ),
      child: Text(
        display,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      height: 350,
      width: 350,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button("7"),
              _button("8"),
              _button("9"),
              _operador("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button("4"),
              _button("5"),
              _button("6"),
              _operador("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button("1"),
              _button("2"),
              _button("3"),
              _operador("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _zerarDisplay("C"),
              _button("0"),
              _operador("+"),
              _resultado("="),
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(x) {
    return Container(
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          addDisplay(x);
        },
        child: Text(x),
      ),
    );
  }

  Widget _operador(x) {
    return Container(
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          addDisplay(x);
          operador = x;
        },
        child: Text(x),
      ),
    );
  }

  Widget _resultado(x) {
    return Container(
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          List<String> numero = display.split(operador);

          double numero1 = double.parse(numero[0]);
          double numero2 = double.parse(numero[1]);
          double resultado = 0;

          if (operador == "+") {
            resultado = numero1 + numero2;
          } else if (operador == "-") {
            resultado = numero1 - numero2;
          } else if (operador == "*") {
            resultado = numero1 * numero2;
          } else if (operador == "/") {
            resultado = numero1 / numero2;
          }
          setState(() {
            display = resultado.toString();
          });
        },
        child: Text(x),
      ),
    );
  }

  Widget _zerarDisplay(x) {
    return Container(
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            display = "";
          });
        },
        child: Text(x),
      ),
    );
  }

  void addDisplay(String text) {
    setState(() {
      display += text;
    });
  }
}
