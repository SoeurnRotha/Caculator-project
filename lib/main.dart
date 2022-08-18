import 'package:caculator/myPage.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(caculatorApp());
}
class caculatorApp extends StatefulWidget {
  const caculatorApp({Key? key}) : super(key: key);

  @override
  State<caculatorApp> createState() => _caculatorAppState();


}

class _caculatorAppState extends State<caculatorApp> {
  var question = '';
  var answer = '';
  final List<String> button = [
    'C' , 'DEL' , '%' , '/',
    '9' , '8' , '7' , 'x' ,
    '6' , '5' , '4' , '-',
    '3' , '2' , '1' , '+',
    '0' , '.' , '00' , '='

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.black,
        body: _buildBody,
      ),
    );
  }
  get _buildBody {
    return Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Container(child: Text(question,style: TextStyle(fontSize: 60,color: Colors.white),)),
                    SizedBox(height: 20,),
                    Container(child: Text(answer,style: TextStyle(fontSize: 60,color: Colors.white),))
                  ],
                ),
              ),
            )
        ),
        Expanded(
          flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: button.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context,index){
                    if(index ==0){
                      return Mybutton(
                        buttomTap: (){
                          setState((){
                            question = '';
                            answer = '';
                          });
                        },
                        buttonText: button[index],
                        color: Colors.grey[700],
                        textColors:Colors.black,
                      );
                    }else if(index ==1){
                      return Mybutton(
                        buttomTap: (){
                          setState((){
                            question = question.substring(0,question.length -1);
                          });
                        },
                        buttonText: button[index],
                        color:Colors.orange,
                        textColors:Colors.white,
                      );
                    }else if(index == button.length -1){
                      return Mybutton(
                        buttomTap: (){
                          setState((){
                            expression();
                          });
                        },
                        buttonText: button[index],
                        color:Colors.orange,
                        textColors:Colors.white,
                      );
                    }
                    else{
                      return Mybutton(
                        buttomTap: (){
                          setState((){
                            question += button[index];
                          });
                        },
                        buttonText: button[index],
                        color:isOprator(button[index]) ? Colors.orange :  Colors.grey[700],
                        textColors: isOprator(button[index]) ? Colors.white :  Colors.white,
                      );
                    }
                  }),
            )
        )
      ],
    );
  }

  bool isOprator(String x){
    if(x== '%' || x =='/' || x=='x' || x == '=' || x == '+' || x =='-'){
      return true;
    }else{
      return false;
    }
  }
  void expression(){
    String finalQustion = question;
    finalQustion = finalQustion.replaceAll('x', '*');


    Parser p = Parser();
    Expression exp = p.parse(finalQustion);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);
     answer = eval.toString();

  }
}

