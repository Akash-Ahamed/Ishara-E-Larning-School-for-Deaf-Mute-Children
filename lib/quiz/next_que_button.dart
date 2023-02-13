import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';


class NextQueButton extends StatelessWidget {
  const NextQueButton({Key? key, required this.nextQuestion}) : super(key: key);
  final VoidCallback nextQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        margin: EdgeInsets.only(left: 60),
        decoration: BoxDecoration(
         color:Colors.green ,
          borderRadius: BorderRadius.circular(10.0),
        ),
        //padding: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(7),
        child: Text("পরবর্তী প্রশ্ন", textAlign: TextAlign.center,
          style: TextStyle(decoration: TextDecoration.none,fontSize: 18,color: natural),),
      ),
    );
  }
}
