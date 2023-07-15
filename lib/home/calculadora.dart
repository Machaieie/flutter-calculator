import 'package:flutter/material.dart';
//import 'package:flutter_icon/flutter_icon.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  // metodo de botoes
  Widget botoesNumericos(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        
        onPressed: () {
          //TODO adiciobar evento quando o botao for clicado
        },
        child: Text(btntxt,
        style: TextStyle(fontSize: 35,
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

  Widget botaoExcluir(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        
        onPressed: () {
          //TODO adiciobar evento quando o botao for clicado
        },
        child: Text(btntxt,
        style: TextStyle(fontSize: 35,
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
        onPressed: (){
          //TODO adicionar evento quando o botao for clicado

        }, 
        child: Text(btntxt,
        style: TextStyle(
          fontSize: 28,
        color: txtcolor
        ),
        ),
        style:  ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: Colors.black87
        )
      ),
    );
  }

  Widget botoesOperacionais (String btntxt, Color btncolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
       
        onPressed: (){
          //TODO adicionar evento quando o botao for clicado

        }, 
        child: Text(btntxt, style: TextStyle(
          fontSize: 28,
          color: txtcolor
        ),),
         style:  ElevatedButton.styleFrom(
          
          shape: CircleBorder(),
          backgroundColor: Colors.lightBlue,
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
                    style: TextStyle(color: Colors.white, fontSize: 100),
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
                  botoesOperacionais("AC", Colors.grey, Colors.white),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: (){}, 
                        icon: const Icon(Icons.remove_road), 
                        label: Text('', style: TextStyle(fontSize: 25),))
                        ),
                  ),
                  botoesOperacionais("=", Colors.grey, Colors.white),
                ],
              )
            ])));
  }
}
