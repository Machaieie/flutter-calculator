import 'package:flutter/material.dart';

class Page extends StatefulWidget {

  const Page({ super.key });

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  dynamic text =  '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';  
  dynamic operator = '';
  dynamic preoperator = '';
   @override
   Widget build(BuildContext context) {
       return Padding(
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
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('$text')
                                ],

                              ),
                            )
                          ),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      smallButtons("√", Colors.grey, Colors.white),
                      smallButtons("π", Colors.grey, Colors.white),
                      smallButtons("^", Colors.grey, Colors.white),
                      smallButtons("!", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      clearButton("AC", Colors.grey, Colors.white),
                      operatorButtons("( )", Colors.grey, Colors.white),
                      operatorButtons("%", Colors.grey, Colors.white),
                      operatorButtons("÷", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      numberButtons("7", Colors.grey, Colors.white),
                      numberButtons("8", Colors.grey, Colors.white),
                      numberButtons("9", Colors.grey, Colors.white),
                      operatorButtons("x", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      numberButtons("4", Colors.grey, Colors.white),
                      numberButtons("5", Colors.grey, Colors.white),
                      numberButtons("6", Colors.grey, Colors.white),
                      operatorButtons("-", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      numberButtons("1", Colors.grey, Colors.white),
                      numberButtons("2", Colors.grey, Colors.white),
                      numberButtons("3", Colors.grey, Colors.white),
                      operatorButtons("+", Colors.grey, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      numberButtons("0", Colors.grey, Colors.white),
                      numberButtons(".", Colors.grey, Colors.white),
                      deleteButton("", Colors.grey, Colors.white),
                      operatorButtons("=", Colors.grey, Colors.white),
                    ],
                  )
                ])
       );
  }
  Widget clearButton(String btntxt, Color btncolor, Color txtcolor ){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          calculations(btntxt);
        }, child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        )),
    );

  }
  // Delete button
  Widget deleteButton(String btntxt, Color btncolor, Color txtcolor ){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          calculations(btntxt);
        }, child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        )),
    );
  }

  // Small buttons 
  Widget smallButtons(String btntxt, Color btncolor, Color txtcolor ){
    return Container(
      child: ElevatedButton(
        onPressed: (){}, child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        )),
    );
  }

  // number buttons
  Widget numberButtons(String btntxt, Color btncolor, Color txtcolor ){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          calculations(btntxt);
        }, child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        )),
    );
  }

  Widget operatorButtons(String btntxt, Color btncolor, Color txtcolor ){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          calculations(btntxt);
        }, child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        )),
    );
  }



  void calculations (btntxt){
    if(btntxt == "AC"){
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      operator = '';
      preoperator = '';
    }else if(operator == '=' && btntxt == '='){
      if (preoperator == '+') {
        finalResult = add();
      } else if (preoperator == '-') {
        finalResult = sub();
      } else if (preoperator == 'x') {
        finalResult = mul();
      } else if (preoperator == '÷') {
        finalResult = div();
      }
    }else if(
        btntxt == '+' ||
        btntxt == '-' ||
        btntxt == 'x' ||
        btntxt == '/' ||
        btntxt == '='
    ){
       if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (operator == '+') {
        finalResult = add();
      } else if (operator == '-') {
        finalResult = sub();
      } else if (operator == 'x') {
        finalResult = mul();
      } else if (operator == '÷') {
        finalResult = div();
      }
      preoperator = operator;
      operator = btntxt;
      result = '';
    }else if (btntxt == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btntxt == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } 
     else {
      result = result + btntxt;
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
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
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