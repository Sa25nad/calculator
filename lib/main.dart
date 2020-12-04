import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(CalcultorDSC());

class CalcultorDSC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNumber = 0;
  double secondNumber = 0;
  String result = '0';
  String operationSymbol = ''; // + - * /
  String numberOnScreen = '0';

  void buttonPressed(buttonText) {
    if (buttonText == 'CLEAR') {
      // RESET THE CALCULATOR

      result = '0';
      firstNumber = 0;
      secondNumber = 0;
      operationSymbol = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      operationSymbol = buttonText;
      result = ''; // make the system not change the number on screen
      firstNumber = double.parse(
          numberOnScreen); // take first num and change to dbl and show on result screen

    } else if (buttonText == '=') {
      secondNumber = double.parse(numberOnScreen);

      if (operationSymbol == '+') {
        // add method
        result = (firstNumber + secondNumber).toString();
      }
      // sub method
      if (operationSymbol == '-') {
        result = (firstNumber - secondNumber).toString();
      }
      // multi method
      if (operationSymbol == '*') {
        result = (firstNumber * secondNumber).toString();
      }

      // division method
      if (operationSymbol == '/') {
        result = (firstNumber / secondNumber).toString();
      }

      firstNumber = 0;
      secondNumber = 0;
      operationSymbol = '';
    } else {
      result = result + buttonText;
    }

    setState(() {
      numberOnScreen = double.parse(result).toString();
    });
  }

  Widget calcButtonNumber(String buttonText) {
    // this is the button for the numbers
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xffe29578)),
          ),
          padding: EdgeInsets.all(18.0),
          elevation: 8,
          focusElevation: 10,
          splashColor: Color(0xffffff3f),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            //change the font style
            style: GoogleFonts.russoOne(textStyle: TextStyle(fontSize: 20.0)),
          ),
          color: Color(0xff83c5be),
          textColor: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Calculator DSC',
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(color: Color(0xffb7e4c7), fontSize: 23),
            ),
          ),
        ),
        backgroundColor: Color(0xff006d77),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
              child: Text(numberOnScreen, // the result for the calculation
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            Expanded(
                child: Divider(
              height: 50,
            )),
            Column(
              children: [
                Row(
                  children: [
                    calcButtonNumber('7'),
                    calcButtonNumber('8'),
                    calcButtonNumber('9'),
                    calcButtonNumber('/'),
                  ],
                ),
                Row(
                  children: [
                    calcButtonNumber('4'),
                    calcButtonNumber('5'),
                    calcButtonNumber('6'),
                    calcButtonNumber('*'),
                  ],
                ),
                Row(
                  children: [
                    calcButtonNumber('1'),
                    calcButtonNumber('2'),
                    calcButtonNumber('3'),
                    calcButtonNumber('-'),
                  ],
                ),
                Row(
                  children: [
                    calcButtonNumber('.'),
                    calcButtonNumber('0'),
                    calcButtonNumber('00'),
                    calcButtonNumber('+'),
                  ],
                ),
                Row(
                  children: [
                    calcButtonNumber('CLEAR'),
                    calcButtonNumber('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
