import 'package:flutter/material.dart';
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
          title: const Text('Calculadora'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        //TODO Calculate Screen
                        child: Text(
                          _displayValue,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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

  Widget Buttons(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            //TODO adicionar evento quando o botao for clicado
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

  Widget smallButtons(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            //TODO adicionar evento quando o botao for clicado
            onButtonPressed( btntxt);
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

  void _deleteDigit() {
    setState(() {
      if (_displayValue.isNotEmpty) {
        _displayValue = _displayValue.substring(0, _displayValue.length - 1);
      }
    });
  }

  //
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
       // _displayValue = _calculate()!;
        _operation = '';
        _operand1 = 0;
        _operand2 = 0;
      } else {
        _displayValue += btntxt;
      }
    });
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

  void _clearScreen() {
    setState(() {
      _displayValue = '';
      _operand1 = 0;
      _operand2 = 0;
      _operation = '';
    });
  }
}
// TODO thaks for watching 