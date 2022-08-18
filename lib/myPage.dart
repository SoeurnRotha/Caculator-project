import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  const Mybutton({Key? key, this.color, this.textColors, required this.buttonText, this.buttomTap}) : super(key: key);

  final color;
  final textColors;
  final String buttonText;

  final buttomTap;

  // Mybutton({this.color,this.textColors,this.buttonText = ""});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttomTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            alignment: Alignment.center,
            color: color,
            child: Text(buttonText,style: TextStyle(color: textColors,fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
