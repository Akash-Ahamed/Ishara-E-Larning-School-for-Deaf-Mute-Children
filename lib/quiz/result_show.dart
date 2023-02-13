import 'package:flutter/material.dart';

import '../colors/colors.dart';


class ResultBox extends StatelessWidget {
  const ResultBox({Key? key,required this.result, required this.questionLength, required this.onClicked}) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Padding(padding:EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ফলাফল",
              style: TextStyle(color: natural,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 15.0),
            CircleAvatar(
              child: Text('$result/$questionLength',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              radius: 60,
              backgroundColor: result == questionLength/2
                  ? Colors.yellow       //when the result is half it's show
                  : result < questionLength/ 2 ?incorrect     //when the result is less than half it's show
                  : correct,    //when the result is more than half it's show
            ),
            SizedBox(height: 15.0),
            Text(result == questionLength/2
                ? "মাঝারি" : result < questionLength/ 2 ? 'আবার চেষ্টা করুন' : 'অসাধারণ',
              style: TextStyle(color: natural),),
            SizedBox(height: 20.0),
            /* GestureDetector(
            onTap: onClicked,
            child: Text('পুনরায় শুরু করুন', style: TextStyle(color: Colors.blue,fontSize: 20.0, fontWeight: FontWeight.bold,letterSpacing: 1.0),),
          ),*/
            GestureDetector(
              onTap: onClicked,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //padding: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(7),
                child: Text("পুনরায় শুরু করুন", textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.none,fontSize: 15,color: natural),),
              ),
            )
          ],),),
    );
  }
}
