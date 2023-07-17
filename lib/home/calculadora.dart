import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
   String _displayValue = '';
  double _operand1 = 0;
  double _operand2 = 0;
  String _operation = '';

  @override
  void initState(){
    // TODO: Estado iinicial da aplicacão
    super.initState();
    

  }
  // metodo de botoes

  Widget botaoDelete(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
        child: ElevatedButton(
      onPressed: () {
        _deleteDigit();
    },
      child: FaIcon(FontAwesomeIcons.deleteLeft),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.red, // <-- Button color
        foregroundColor: Colors.white, // <-- Splash color
      ),
    ));
  }

  Widget botoesNumericos(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //TODO adiciobar evento quando o botao for clicado
          onButtonPressed(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: const Color.fromARGB(179, 85, 85, 85),
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }

  Widget bottoesPequenos(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            //TODO adicionar evento quando o botao for clicado
            onButtonPressed(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 28, color: txtcolor),
          ),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), backgroundColor: Color.fromARGB(255, 88, 121, 255))),
    );
  }

  Widget botoesOperacionais(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //TODO: adicionar evento quando o botao for clicado
           onButtonPressed(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(fontSize: 28, color: txtcolor),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.orangeAccent,
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget botaoLimpar(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //TODO adicionar evento quando o botao for clicado
         _clearScreen();
        },
        child: Text(
          btntxt,
          style: TextStyle(fontSize: 28, color: txtcolor),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.green,
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Calculadora'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(_displayValue,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35
                                  ),),

                              
                          
                          ),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      bottoesPequenos("√", Colors.grey, Colors.white),
                      bottoesPequenos("π", Colors.grey, Colors.white),
                      bottoesPequenos("^", Colors.grey, Colors.white),
                      bottoesPequenos("!", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      botaoLimpar("AC", Colors.grey, Colors.white),
                      botoesOperacionais("( )", Colors.grey, Colors.white),
                      botoesOperacionais("%", Colors.grey, Colors.white),
                      botoesOperacionais("÷", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      botoesNumericos("7", Colors.grey, Colors.white),
                      botoesNumericos("8", Colors.grey, Colors.white),
                      botoesNumericos("9", Colors.grey, Colors.white),
                      botoesOperacionais("x", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      botoesNumericos("4", Colors.grey, Colors.white),
                      botoesNumericos("5", Colors.grey, Colors.white),
                      botoesNumericos("6", Colors.grey, Colors.white),
                      botoesOperacionais("-", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      botoesNumericos("1", Colors.grey, Colors.white),
                      botoesNumericos("2", Colors.grey, Colors.white),
                      botoesNumericos("3", Colors.grey, Colors.white),
                      botoesOperacionais("+", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      botoesNumericos("0", Colors.grey, Colors.white),
                      botoesNumericos(".", Colors.grey, Colors.white),
                      botaoDelete("del", Colors.grey, Colors.white),
                      botoesOperacionais("=", Colors.grey, Colors.white),
                    ],
                  )
                ])));
  }
void _deleteDigit() {
  setState(() {
    if (_displayValue.isNotEmpty) {
      _displayValue = _displayValue.substring(0, _displayValue.length - 1);
    }
  });
}
  // Logica da calculadora
  // calculos
 void onButtonPressed(String btntxt) {
    setState(() {
      if (btntxt == 'C') {
        _clearScreen();
      } else if (btntxt == '+' || btntxt == '-' || btntxt == 'x' || btntxt == '÷') {
        _operation = btntxt;
        _operand1 = double.parse(_displayValue);
        _displayValue = '';
      } else if (btntxt == '=') {
        _operand2 = double.parse(_displayValue);
        _displayValue = _calculate()!;
        _operation = '';
        _operand1 = 0;
        _operand2 = 0;
      } else {
        _displayValue += btntxt;
      }
    });
  }

void _clearScreen() {
  setState(() {
   _displayValue = '';
      _operand1 = 0;
      _operand2 = 0;
      _operation = '';
  });
}

String? _calculate() {
    if (_displayValue.isNotEmpty && _operation.isNotEmpty) {
    double operand2 = double.parse(_displayValue);
    double result = 0;
    switch (_operation) {
      case '+':
        result = _operand1 + operand2;
        break;
      case '-':
        result = _operand1 - operand2;
        break;
      case '*':
        result = _operand1 * operand2;
        break;
      case '/':
        result = _operand1 / operand2;
        break;
    }
    _displayValue = result.toString();
    _operand1 = result;
  }
  _operation = '';
  
}
}