import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({ super.key });
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String output = '0';
  String currentInput = '';
  String operand = '';
  double num1 = 0;
  double num2 = 0;

  buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      output = '0';
      currentInput = '';
      operand = '';
      num1 = 0;
      num2 = 0;
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      num1 = double.parse(currentInput);
      operand = buttonText;
      currentInput = '';
    } else if (buttonText == '.') {
      if (!currentInput.contains('.')) {
        currentInput += buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(currentInput);
      switch (operand) {
        case '+': {
          output = (num1 + num2).toString();
          break;
        }
        case '-': {
          output = (num1 - num2).toString();
          break;
        }
        case '*': {
          output = (num1 * num2).toString();
          break;
        }
        case '/': {
          output = (num1 / num2).toString();
          break;
        }
        default: {
          break;
        }
      }

      num1 = 0;
      num2 = 0;
      operand = '';
      currentInput = output;
    } else {
      currentInput += buttonText;
      output = currentInput;
    }

    setState(() {
      output = double.parse(output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ]
              ),
              Row(
                children: <Widget>[
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ]
              ),
              Row(
                children: <Widget>[
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ]
              ),
              Row(
                children: <Widget>[
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+'),
                ]
              ),
              Row(
                children: <Widget>[
                  buildButton('C'),
                  buildButton('='),
                ]
              ),
            ]
          )
        ]
      )
    );
  }
}