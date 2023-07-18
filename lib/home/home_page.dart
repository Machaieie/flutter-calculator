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
          title: const Text('HomePage'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              child:  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.yellow
                      ),
                    ), 
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red
                      ),
                    ),  
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.pink
                      ),
                    ), 
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                    ), 
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red
                      ),
                    ), 
                  ],
                ),
              ),
            ),
             Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height *.6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                         color: Colors.orange,
                          width: 300,
                          height: 120,
                          child: Text("Texto"),
                        ), 
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                         color: Colors.pink,
                          width: 300,
                          height: 120,
                          child: Text("Texto"),
                        ), 
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                         color: Colors.blue,
                          width: 300,
                          height: 115,
                          child: Text("Texto"),
                        ), 
                    ],
                  ),
                  
                  

                ],
              ),
             ) 
            ],
          ),
          )
      );
  }

  Widget Buttons(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            //TODO adicionar evento quando o botao for clicado
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 35, color: txtcolor),
          ),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Color.fromARGB(255, 88, 121, 255))),
    );
  }

  void _deleteDigit() {
    setState(() {
      if (_displayValue.isNotEmpty) {
        _displayValue = _displayValue.substring(0, _displayValue.length - 1);
      }
    });
  }

  // Logica da HomePage
  // calculos
  void onButtonPressed(String btntxt) {}

  void _clearScreen() {
    setState(() {
      _displayValue = '';
      _operand1 = 0;
      _operand2 = 0;
      _operation = '';
    });
  }
}
