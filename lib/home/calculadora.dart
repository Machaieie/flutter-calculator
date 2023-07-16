import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  // metodo de botoes

  Widget botaoDelete(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
        child: ElevatedButton(
      onPressed: () {},
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
          calculation('0');
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
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 28, color: txtcolor),
          ),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), backgroundColor: Colors.black87)),
    );
  }

  Widget botoesOperacionais(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //TODO: adicionar evento quando o botao for clicado
           calculation('0');
        },
        child: Text(
          btntxt,
          style: TextStyle(fontSize: 28, color: txtcolor),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.lightBlue,
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
                          child: Text(
                            "$text",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 60),
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
                      botaoDelete("", Colors.grey, Colors.white),
                      botoesOperacionais("=", Colors.grey, Colors.white),
                    ],
                  )
                ])));
  }

  // Logica da calculadora
  // calculos
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
