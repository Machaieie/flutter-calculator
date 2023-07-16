
class Operations {
dynamic text ='0';
double numOne = 0;
double numTwo = 0;
dynamic result = '';
dynamic finalResult = '';
dynamic operator = '';
dynamic preOpr = '';
dynamic displaytxt = 20;

  void calculations(btntxt){
    if(btntxt  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      operator = '';
      preOpr = '';
    
    }
  }
}