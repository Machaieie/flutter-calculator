import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _displayValue = '';
  double _operand1 = 0;
  double _operand2 = 0;
  String _operation = '';
  double result = 0;

  @override
  void initState() {
    // TODO: Estado iinicial da aplicacão
    super.initState();
  }
  // metodo de botoes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text('Calculadora'),
          ) ,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //container for operations screen
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            _displayValue,
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // container for button screen
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6,
                child: Column(
                  children: <Widget>[
                    // TODO Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        smallButtons("√", Colors.black, Colors.white),
                        smallButtons("π", Colors.black, Colors.white),
                        smallButtons("^", Colors.black, Colors.white),
                        smallButtons("!", Colors.black, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        clearButton("AC"),
                        Buttons("ln", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("%", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("÷", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Buttons("7", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("8", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("9", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("x", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Buttons("4", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("5", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("6", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("-", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Buttons("1", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("2", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("3", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons("+", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Buttons("0", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        Buttons(".", const Color.fromARGB(221, 39, 39, 39),
                            Colors.white),
                        BackSpace("del", Colors.red, Colors.white),
                        Buttons("=", Colors.orange, Colors.white),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
// button for the numbers
  Widget Buttons(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            //TODO adicionar evento quando o botao for clicado
            onButtonPressed(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 32, color: txtcolor),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: btncolor,
            padding: EdgeInsets.all(10),
          )),
    );
  }
// button for special operations such as ! ^ π and √
  Widget smallButtons(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            //TODO adicionar evento quando o botao for clicado
            onButtonPressed(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 25, color: txtcolor),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: btncolor,
            padding: EdgeInsets.all(10),
          )),
    );
  }

// button to delete numbers one by one
  Widget BackSpace(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
        child: ElevatedButton(
      onPressed: () {
        _deleteDigit();
      },
      child: FaIcon(FontAwesomeIcons.deleteLeft),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(19),
        backgroundColor: Colors.red, // <-- Button color
        foregroundColor: Colors.white, // <-- Splash color
      ),
    ));
  }
// method to erase numbers one by one
  void _deleteDigit() {
    setState(() {
      if (_displayValue.isNotEmpty) {
        _displayValue = _displayValue.substring(0, _displayValue.length - 1);
      }
    });
  }

  //event that occurs when clicking on the button
  void onButtonPressed(String btntxt) {
    switch (btntxt) {
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case "0":
      case ".":
        setState(() {
          _displayValue += btntxt;

          if (_displayValue.contains(".")) {
            //
          } else {
             int number = int.parse(_displayValue);
            _displayValue = number.toString();
          }
        });

        break;

      case "AC":
        _clearScreen();
        break;

      case "√":
      _operand1 = double.parse(_displayValue);
      result = sqrt(_operand1);
      conversor();
        break;

      case "π":
      _operand1 = double.parse(_displayValue);
       double pi = 3.141592653589793;
      result = _operand1 * pi;
      conversor();
        break;

      case "^":
      _operation = btntxt;
      _operand1 = double.parse(_displayValue);
      _displayValue = "0";
        break;

      case "ln":
      _operand1 = double.parse(_displayValue);
      result = log(_operand1)/ln10;
      conversor();
        break;

      case "!":
      _operand1 = double.parse(_displayValue);
      int num = factorialRecursive(_operand1.toInt());
      result = num.toDouble();
      conversor();
      break;

      case "=":
      //second operator converting to double

          
        _operand2 = double.parse(_displayValue);
        if(_operand2 == 0.0){
          return;
        }else if (_operation == "+") {

          // doing calculations
          result = _operand1 + _operand2;
          conversor();
        
        } else if (_operation == "-") {
          result = _operand1 - _operand2;
          conversor();
          
        } else if (_operation == "x") {
          result = _operand1 * _operand2;
          conversor();
        } else if (_operation == "÷") {
          result = _operand1 / _operand2;
          conversor();
        }else if(_operation == "!"){
          int num = int.parse(_displayValue);
          int fact = factorialRecursive(num);
          result = fact.toDouble();
          conversor();
        }else if(_operation == "^"){
         num dado = pow(_operand1, _operand2);
         result = dado.toDouble();
         conversor();
        }
        
        


        

        break;

      case "+":
      //if the subtraction button is clicked, it stores the value of the first number
      // and the screen value is reset
        _operation = btntxt;
        _operand1 = double.parse(_displayValue);
        _displayValue = "0";
        break;

      case "-":
      //if the subtraction button is clicked, it stores the value of the first number
      // and the screen value is reset
        _operation = btntxt;
        _operand1 = double.parse(_displayValue);
        _displayValue = "0";
        break;

      case "x":
      //if the subtraction button is clicked, it stores the value of the first number
      // and the screen value is reset
        _operation = btntxt;
        _operand1 = double.parse(_displayValue);
        _displayValue = "0";
        break;

      case "÷":
      //if the subtraction button is clicked, it stores the value of the first number
      // and the screen value is reset
        _operation = btntxt;
        _operand1 = double.parse(_displayValue);
        _displayValue = "0";
        break;

        case "%":
        _operand1 = double.parse(_displayValue);
        result = _operand1/100;
        conversor();
        break;

      default:
    }
  }

  //TODO clear button
  Widget clearButton(String btntxt) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          _clearScreen();
        },
        child: Text(
          btntxt,
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.red,
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  // method to clear the screen
  void _clearScreen() {
    setState(() {
      _displayValue = '0';
      _operand1 = 0;
      _operand2 = 0;
      _operation = '';
    });
  }
// method to calculate the factorial of a number
 int factorialRecursive(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * factorialRecursive(n - 1);
  }
}
// method to convert double to integer
void conversor(){
  //converting the result to a string
          String resulted = result.toString();

        //inserting the result into the list to get the integer part
        List<String> results = resulted.split(".");

        // here if the decimal part is multiplied by zero and the result is zero we will not get the zero
        if(int.parse(results[1]) *1 ==0){
          int formatedResult = int.parse(results[0]);
          setState(() {
            _displayValue = formatedResult.toString();
          });
          //otherwise we will also show the decimal part
        }else{
          double formatedResult = result;
          setState(() {
          _displayValue = formatedResult.toString();
        });
        }}
}

