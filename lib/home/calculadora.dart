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
)
    );
  }

  Widget botoesNumericos(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //TODO adiciobar evento quando o botao for clicado
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
          //TODO adicionar evento quando o botao for clicado
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
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "0",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bottoesPequenos("√", Colors.grey, Colors.white),
                  bottoesPequenos("π", Colors.grey, Colors.white),
                  bottoesPequenos("^", Colors.grey, Colors.white),
                  bottoesPequenos("!", Colors.grey, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  botaoLimpar("AC", Colors.grey, Colors.white),
                  botoesOperacionais("( )", Colors.grey, Colors.white),
                  botoesOperacionais("%", Colors.grey, Colors.white),
                  botoesOperacionais("÷", Colors.grey, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  botoesNumericos("7", Colors.grey, Colors.white),
                  botoesNumericos("8", Colors.grey, Colors.white),
                  botoesNumericos("9", Colors.grey, Colors.white),
                  botoesOperacionais("x", Colors.grey, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  botoesNumericos("4", Colors.grey, Colors.white),
                  botoesNumericos("5", Colors.grey, Colors.white),
                  botoesNumericos("6", Colors.grey, Colors.white),
                  botoesOperacionais("-", Colors.grey, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  botoesNumericos("1", Colors.grey, Colors.white),
                  botoesNumericos("2", Colors.grey, Colors.white),
                  botoesNumericos("3", Colors.grey, Colors.white),
                  botoesOperacionais("+", Colors.grey, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  botoesNumericos("0", Colors.grey, Colors.white),
                  botoesNumericos(".", Colors.grey, Colors.white),
                  botaoDelete("", Colors.grey, Colors.white),
                  botoesOperacionais("=", Colors.grey, Colors.white),
                ],
              )
            ])));
  }
}
