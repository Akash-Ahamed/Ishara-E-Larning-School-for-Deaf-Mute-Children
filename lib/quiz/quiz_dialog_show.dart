
import 'package:Ishara_final_version_1/detection/TfliteModel.dart';
import 'package:Ishara_final_version_1/quiz/quiz_content_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QuizBox extends StatelessWidget {
  const QuizBox({Key? key, required this.onClicked }) : super(key: key);

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
            Text("অভিনন্দন",
              style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 15.0),
            Text("আপনি সফলভাবে আপনার শিক্ষা শেষ করছেন",
              style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 15.0),

            /* GestureDetector(
            onTap: onClicked,
            child: Text('পুনরায় শুরু করুন', style: TextStyle(color: Colors.blue,fontSize: 20.0, fontWeight: FontWeight.bold,letterSpacing: 1.0),),
          ),*/
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //start learning box start
                  GestureDetector(
                    onTap: onClicked,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFBB85AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //padding: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(7),
                      child: Text("পুনরায় শেখার শুরু করুন", textAlign: TextAlign.center,
                        style: TextStyle(decoration: TextDecoration.none,fontSize: 15,color: Colors.white),),
                    ),
                  ),
                  //start learning box end
                  SizedBox(width: 15,),
                  //start quiz box start
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizContentPage() ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFBB85AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //padding: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(7),
                      child: Text("কুইজে অংশগ্রহণ করুন", textAlign: TextAlign.center,
                        style: TextStyle(decoration: TextDecoration.none,fontSize: 15,color: Colors.white),),
                    ),
                  ),
                  //start quiz box end
                  SizedBox(width: 15,),
                  //start sign detection box start
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TfliteModel() ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFBB85AB),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //padding: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(7),
                      child: Text("ছবি সনাক্ত করুন।", textAlign: TextAlign.center,
                        style: TextStyle(decoration: TextDecoration.none,fontSize: 15,color: Colors.white),),
                    ),
                  ),
                  //start finger spelling box end
                ],
              ),
            ),
          ],),),
    );
  }
}
