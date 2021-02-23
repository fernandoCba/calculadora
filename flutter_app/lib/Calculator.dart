import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

import 'BusinessCard.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var output = "0";
  var accumulator = 0;
  var prevOperator = "";
  var num1 = 0;
  var num2 = 0;

  final displayerTextStyle = TextStyle(
    fontSize: 25,
  );

  final keyboardTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final display = Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomRight,
      height: 90,
      color: Colors.grey,
      child: Text(
        output,
        style: displayerTextStyle,
      ),
    );

    final keyboard = _buildKeyboard();
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text('Rustic Calculator'),
      ),
      body: Container(
        child: Column(
          children: [
            display,
            keyboard,
          ],
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('App developed by Fernando Rodriguez'),
              ElevatedButton(
                onPressed: _navigateToBusinessCard,
                child: const Text('Contact Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToBusinessCard() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessCard()));
  }

  Widget _buildKeyboard() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _calcNumberButton(7),
            _calcNumberButton(8),
            _calcNumberButton(9),
            _calcOperatorButton("C"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _calcNumberButton(4),
            _calcNumberButton(5),
            _calcNumberButton(6),
            _calcOperatorButton("/"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _calcNumberButton(1),
            _calcNumberButton(2),
            _calcNumberButton(3),
            _calcOperatorButton("*"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _calcOperatorButton("="),
            _calcNumberButton(0),
            _calcOperatorButton("-"),
            _calcOperatorButton("+"),
          ],
        ),
      ],
    ));
  }

  Widget _calcNumberButton(int i) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black26,
        ),
        child: TextButton(
            child: Text(
              i.toString(),
              style: keyboardTextStyle,
            ),
            onPressed: () {
              setState(() {
                if (output == "0") output = "";
                output += i.toString();
              });
            }));
  }

  Widget _calcOperatorButton(String op) {
    return TextButton(
        child: Text(
          op,
          style: keyboardTextStyle,
        ),
        onPressed: () {
          setState(() {
            if (op == "=") {
              Parser parser = Parser();
              Expression exp = parser.parse(output);
              output = exp.evaluate(EvaluationType.REAL, null).toString();
            } else if (op == "C") {
              output = "0";
            } else {
              output += ' ' + op + ' ';
            }
          });
        });
  }
}
