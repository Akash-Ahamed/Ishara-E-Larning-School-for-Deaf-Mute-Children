import 'package:Ishara_final_version_1/Modal/number_data_modal.dart';
import 'package:flutter/material.dart';


import '../quiz/quiz_dialog_show.dart';


class NumberDisplayPage extends StatefulWidget {
  //const NumberDisplayPage({Key? key}) : super(key: key);

  final List<NumberDataModel> numberDataModel;
  int index;
  NumberDisplayPage({Key? key, required this.index, required this.numberDataModel}): super(key: key);

  @override
  State<NumberDisplayPage> createState() => _NumberDisplayPageState();
}

class _NumberDisplayPageState extends State<NumberDisplayPage> {
  //Start Over function
  void startOver(){
    setState(() {
      widget.index = 0;
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
              image: AssetImage("images/Stage_4.png"),
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
                  Container(
                    height: 175,
                    //width: ,
                    child: Row(
                      children: [
                        Container(
                          //color: Colors.yellow,
                          margin: EdgeInsets.only(left: 80,top: 60),
                          width: 80,
                          child: Material(
                            type: MaterialType.transparency,
                            child: IconButton(
                              iconSize: 100,
                              //color: Colors.blue,
                              icon: Icon(Icons.chevron_left,color: Colors.white),
                              onPressed: (){
                                setState(() {
                                  if (widget.index != 0) {
                                    widget.index--;
                                  }

                                });
                              },
                            ),
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                         //  color: Colors.blue,
                          width: 340,
                            child: Image.asset(widget.numberDataModel[widget.index].ImageIcon),
                        ),
                        Container(
                         // color: Colors.yellow,
                          margin: EdgeInsets.only(top: 60),
                          width: 80,
                          child: Material(
                            type: MaterialType.transparency,
                            child: IconButton(

                              iconSize: 100,
                              //color: Colors.blue,
                              icon: Icon(Icons.chevron_right,color: Colors.white),
                              onPressed: (){
                                setState(() {
                                  if(widget.index!=widget.numberDataModel.length-1){
                                    widget.index++;
                                  }
                                  //Quiz part start show Dialog
                                  else{
                                    showDialog(
                                        context: context,
                                        builder:(ctx)=>QuizBox(onClicked: startOver,)
                                    );
                                  }
                                  //Quiz part start show Dialog end
                                });
                              },
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),

                  //Display Part End

                  //Symbol Part Start
                  Container(
                    // color: Colors.white,
                    margin: EdgeInsets.only(left: 70),

                    height: 70.0,
                    child: Text(widget.numberDataModel[widget.index].ImageName,style: TextStyle(decoration: TextDecoration.none,color: Colors.black),),
                  ),
                  //Symbol Part End
                ],
              ),
            ),

//Trainer Part Start
            Container(
              //color: Colors.white,
              width: 230.0,
              child: Padding(
                padding: EdgeInsets.only(top: 70.0,left: 30.0,right: 10.0),
                child: Image(
                  image: AssetImage("images/Trainer.png"),
                ),
              ),
            ),
            //Trainer Part End

          ],
        ),

        /**/

      ],
    );

    /*Column(
      children: [
        Container(
       //   color: Colors.white,
          height: 200,
          width: 500,
          //child:Image.network(widget.numberDataModel[widget.index].ImageIcon),
          child: Image.asset(widget.numberDataModel[widget.index].ImageIcon),
        ),
        Row(
          children: [
            FloatingActionButton(
              heroTag: 'f1',
                onPressed: (){
                  setState(() {
                    if(widget.index!=0){
                      widget.index--;
                    }
                  });
                },
              child: Icon(Icons.arrow_back),
            ),

            FloatingActionButton(
              heroTag: 'f2',
              onPressed: (){
                setState(() {
                  if(widget.index!=widget.numberDataModel.length-1){
                    widget.index++;
                  }
                });
              },
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),

      ],
    );*/
  }
}
