
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberDetilePage extends StatefulWidget {
  //const NumberDetilePage({Key? key}) : super(key: key);
  int numberDetailID;
  NumberDetilePage(this.numberDetailID);


  @override
  State<NumberDetilePage> createState() => _NumberDetilePageState();
}

class _NumberDetilePageState extends State<NumberDetilePage> {

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
              color: Colors.yellow,
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
                            child: Text("Mathematich",
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
                      height: 200,
                      //width: ,
                      child: Row(
                        children: [
                          Container(
                            //color: Colors.yellow,
                            margin: EdgeInsets.only(left: 80),
                            width: 80,
                            child: Material(
                              type: MaterialType.transparency,
                              child: IconButton(
                                iconSize: 100,
                                //color: Colors.blue,
                                icon: Icon(Icons.chevron_left,color: Colors.white),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ),

                          ),
                          Container(
                           // color: Colors.blue,
                            width: 340,
                            child: Image(
                              image: AssetImage("images/.png"),
                            ),
                          ),
                          Container(
                            //color: Colors.yellow,
                            width: 80,
                             child: Material(
                               type: MaterialType.transparency,
                               child: IconButton(
                                  iconSize: 100,
                                  //color: Colors.blue,
                                  icon: Icon(Icons.chevron_right,color: Colors.white),
                                  onPressed: (){
                                  Navigator.pop(context);
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
                      height: 80.0,
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
     /* Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage("images/Test.png"),
          image: AssetImage("images/Stage.png"),
        fit: BoxFit.cover,

        ),
      ),
    );*/
  }
}