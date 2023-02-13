
import 'package:Ishara_final_version_1/quiz/question_model.dart';
import 'package:Ishara_final_version_1/quiz/question_widget.dart';
import 'package:Ishara_final_version_1/quiz/result_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../colors/colors.dart';
import 'next_que_button.dart';
import 'option_card.dart';

class QuizContentPage extends StatefulWidget {
  const QuizContentPage({Key? key}) : super(key: key);

  @override
  State<QuizContentPage> createState() => _QuizContentPageState();
}

class _QuizContentPageState extends State<QuizContentPage> {
  //Question make
  List<Question> _questions = [
    Question(id: '10',image: 'images/QuizThree.png', title: 'এটা কোন চিহ্ন?', options: {'পাঁচ':false,'তিন':true,'চার':false},
    ),
    Question(id: '11', image:'images/QuizOne.png',title: 'এটা কোন চিহ্ন?', options: {'এক':true,'দুই':false,'শূন্য':false},
    ),
    Question(id: '12', image:'images/QuizFour.png',title: 'এটা কোন চিহ্ন?', options: {'চার':true,'শূন্য':false,'তিন':false},
    )
  ];
 //for loop
  int index = 0;

  // Check the user has clicked or not
  bool isClicked = false;
  bool isAlreadySelected = false;
  //when clicked colors will be change function
  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    }else{
      if(value == true) {
        score ++;
      }
      setState(() {
        isClicked = true;
        isAlreadySelected = true;
      });
    }
  }

  //Score Variable
  int score = 0;

  //Next Question and unselected message show
  void nextQuestion (){
    if (index == _questions.length - 1){
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx)=> ResultBox(
            //user total score
            result: score,
            //total question
            questionLength: _questions.length,
            onClicked: startOver,

          ));
    }else{
      if(isClicked) {
        setState(() {
          index ++;
          isClicked = false;
          isAlreadySelected = false;
        });
      }else{              //Toast message show
        Fluttertoast.showToast(
            msg: "অনুগ্রহ করে যেকোনো একটি নির্বাচন করুন",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 18.0
        );
      }
    }
  }

  //Start Over function
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isClicked = false;
      isAlreadySelected = false;
    });
    //Load the quiz page again
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ////Background Image Start
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Stage_4_New_2.png"),
              // image: AssetImage("images/Stage.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ////Background Image End

        ////
        Row(
          children: [
            Container(
              //color: Colors.yellow,
              width: 600.0,
              //height: 200,
              child: Column(
                children: [
                  //Subject Name Part Start
                  Container(
                    // color: Colors.blue,
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          //color: Colors.black,
                          alignment: Alignment.topLeft,
                          child: Material(
                            type: MaterialType.transparency,
                            child: IconButton(
                              iconSize: 40,
                              //color: Colors.blue,
                              icon: Icon(Icons.arrow_back,color: Colors.black),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.white,
                          width: 500,
                          alignment: Alignment(0.2,0.4),
                          child: Text("গণিত",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Subject Name Part End

                  //Display Part Start
                  SizedBox(height: 15,),
                  //Board part Start
                  Container(
                    margin: EdgeInsets.only(left: 120),
                    height: 25.0,
                    width: 300,
                    //color: Colors.red,
                    child: QuestionWidget(
                      indexAction: index,
                      question: _questions[index].title,
                      totalQuestion: _questions.length,
                    ),
                    //Board part End

                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              for(int i =0; i< _questions[index].options.length;i++)
                                Container(
                                  margin: EdgeInsets.only(left: 150,right: 80),
                                  width: 118,

                                  //Check the ans is correct or not. Means colors change
                                  child: GestureDetector(
                                    onTap: () => checkAnswerAndUpdate(_questions[index].options.values.toList()[i]),
                                    child: OptionCard(
                                      //child: Text(_questions[index].options.keys.toList()[i]),
                                      option: _questions[index].options.keys.toList()[i],
                                      //Check the ans was correct or not

                                      color: isClicked ? _questions[index].options.values.toList()[i] == true ? correct : incorrect : Colors.transparent,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Container(
                            height: 150.0,
                            width: 250,
                            //color: Colors.red,
                            child: Image.asset(_questions[index].image),


                            /* child: QuestionWidget(
                      indexAction: index,
                      question: _questions[index].image,
                      //question:Image.asset(_questions[index].image),
                      totalQuestion: _questions.length,
                    ),*/
                            //Board part End

                          ),
                        ],
                      )
                    ],
                  ),

                  /*for(int i =0; i< _questions[index].options.length;i++)
                    Container(
                      margin: EdgeInsets.only(right: 220),
                      width: 100,

                      //Check the ans is correct or not. Means colors change
                      child: GestureDetector(
                        onTap: () => checkAnswerAndUpdate(_questions[index].options.values.toList()[i]),
                        child: OptionCard(
                          //child: Text(_questions[index].options.keys.toList()[i]),
                          option: _questions[index].options.keys.toList()[i],
                          //Check the ans was correct or not

                          color: isClicked ? _questions[index].options.values.toList()[i] == true ? correct : incorrect : Colors.transparent,
                        ),
                      ),
                    ),*/


                  //Next Question Button Start
                  NextQueButton(nextQuestion: nextQuestion),
                  //Next Question Button End
                ],
              ),
            ),

//Trainer Part Start
            //Score Showing start
            Column(
              children: [
               /* QuestionWidget(
                  indexAction: index,
                  question: _questions[index].title,
                  totalQuestion: _questions.length,
                ),*/
                Container(
                  width: 230.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 68,top: 215),
                    child: Text("স্কোর:$score",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        decoration: TextDecoration.none,
                      ), ),
                  ),
                )
              ],
            ),
            //Score Showing end

            /* Container(
              //color: Colors.white,
               height: 200,
              width: 200.0,
              child: Padding(
                padding: EdgeInsets.only(top: 70.0,left: 30.0,right: 10.0),
                child: Image(
                  image: AssetImage("images/signboard.png"),
                ),
                //actions:[Padding(padding: EdgeInsets.all(10.0),child: Text('Score: $score'),)]
              ),
            ),*/
            //Trainer Part End
          ],
        ),
      ],
    );
  }
}
