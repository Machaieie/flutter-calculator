import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {

  const Calculadora({ super.key });

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
    // metodo de botoes
    Widget bottoes(String btntxt, Color btncolor, Color txtcolor){
      return Container(
        child: ElevatedButton(
          onPressed: () {
          //TODO adiciobar evento quando o botao for clicado
        },
        child: Text(btntxt, 
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
        ),
        ),
      );
    }



   @override
   Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor: Colors.black,
           appBar: AppBar(title: const Text('Calculadora'),
           backgroundColor: Colors.black,
           ),
           body:Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(10.0),
                      child: Text("0", textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white,
                      fontSize: 100),
                      ),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottoes("AC",Colors.grey,Colors.black)
                  ],
                    
                  )
              ]
            )
          )
      );
  }
}