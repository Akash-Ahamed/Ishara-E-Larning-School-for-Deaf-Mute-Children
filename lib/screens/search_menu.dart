import 'package:Ishara_final_version_1/Mathematich/number_dispaly_page.dart';
import 'package:Ishara_final_version_1/alphabet/alphabet_page.dart';
import 'package:Ishara_final_version_1/detection/TfliteModel.dart';
import 'package:Ishara_final_version_1/quiz/quiz_content_page.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import '../Mathematich/number_detaile_page.dart';
import '../searching/search_items_list.dart';
//Main Code Start
/*
class SearchMenu extends StatefulWidget {
  const SearchMenu({Key? key}) : super(key: key);

  @override
  State<SearchMenu> createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  final _minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return Container(
       // color: Colors.red,

        //First Item start
       padding: EdgeInsets.all(_minimumPadding *3),
        child: Column(
          children: [
            Container(
             height: 60.0,
              //color: Colors.black,

              child: Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "অনুসন্ধান",
                      labelStyle: TextStyle(color: Colors.white,fontSize:16.0 ),
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      hintText: "আপনার অনুসন্ধান লিখুন",
                      hintStyle: TextStyle(color: Colors.white70,fontSize: 13.0),

                      border: myborder(),
                      enabledBorder: myborder(),
                      focusedBorder: myborder(),
                    ),
                ),
              ),
            ),
            //First Item End
          ],
        ),
      );
  }
  //Input Border start
  OutlineInputBorder myborder() {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(40.0),

        borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        )
    );

  }

}
// Main Code End
*/



class SearchMenu extends StatefulWidget {
  const SearchMenu({Key? key}) : super(key: key);

  @override
  State<SearchMenu> createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  final _minimumPadding = 5.0;

  //firebase connect

//
  //
  //late int index;
  //NumberDisplayPage({Key? key, required this.index, required this.numberDataModel}): super(key: key);
  final List<Map<String,dynamic>> _allListItems =[
    {
      'id': 1,
      'title': "Number Quiz Page",
      'name': "Quiz",
      'age': QuizContentPage(),
    },

    {
      'id': 2,
      'title': "Sign Predict Page",
      'name': "Sign Predict",
      'age': TfliteModel(),
    },
    {
      'id': 3,
      'title': "Number Display Page",
      'name': "Number Learning ",
      'age': TfliteModel(),
    },


  ];
  List<Map<String,dynamic>> _foundItems =[];



  @override
  void initState() {
    // TODO: implement initState
    _foundItems = _allListItems;
    super.initState();
  }
  void _runFilter(String entereKeyword){
    List<Map<String, dynamic>>results =[];
    if(entereKeyword.isEmpty){
      results = _allListItems;
    }else{
      results= _allListItems.
      where((user) =>
      user["name"].toLowerCase().contains(entereKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundItems = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,

      //First Item start
      padding: EdgeInsets.all(_minimumPadding *3),
      child: Column(
        children: [
          Container(
            height: 60.0,
            //color: Colors.black,

            child: Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "অনুসন্ধান",
                  labelStyle: TextStyle(color: Colors.white,fontSize:16.0 ),
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                  hintText: "আপনার অনুসন্ধান লিখুন",
                  hintStyle: TextStyle(color: Colors.white70,fontSize: 13.0),

                  border: myborder(),
                  enabledBorder: myborder(),
                  focusedBorder: myborder(),
                ),

                //search field start
                onChanged: (value){
                  _runFilter(value);
                },

                //search field end
              ),

              //Search list displayed show start


              //
              /* Expanded(
                  child: _foundItem.isNotEmpty? ListView.builder(
                    itemCount: _foundItem.length,
                      itemBuilder: (context,index)=>
                          Card(Key: ValueKey(_foundItem[index]['id']),
                            color: Colors.amberAccent,
                            elevation: 4,
                            child: GestureDetector(
                              onTap: (){},
                              child: ListTile(
                                leading: Text(_foundItem[index]["id"].toString(),),
                                title: Text(_foundItem[index].['name']),
                                subtitle: Text('${_foundItem[index]['age'].toString()}years old'),
                              ),
                            ),
                          ),
                  )
                     : Text("No result found"),
                ),*/
              //Search list displayed show end
            ),
          ),
          //First Item End
          //SizedBox(height: 10),
         Container(
           height: 300,
           //color: Colors.pinkAccent,
           child: _foundItems.isNotEmpty?ListView.builder(
               itemCount: _foundItems.length,
               itemBuilder: (context,index){
                /* return ListTile(
                   title: Text(_foundItems[index]['name'],style: TextStyle(color: Colors.white),),
                 );*/
                 return Container(
                   padding: EdgeInsets.all(5),
                   height: 50,
                   child: Card(
                     elevation: 0,
                    // color: Color(0xFF03045e),
                     color: Colors.red,
                     key: ValueKey(_foundItems[index]["id"]),
                    // color: Colors.white,
                     //elevation: 5,
                     child: GestureDetector(
                     onTap: (){
                         //Navigator.push(context, MaterialPageRoute(builder: (context) );
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NumberDisplayPage(index: index,numberDataModel: Numberdata) ));
                           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                           return Scaffold(
                             body: _foundItems[index]['age'],
                           );
                           }
                         ),
                         );

                       },
                       child: ListTile(
                         //leading: Text(_foundItems[index]['id'].toString(),style: TextStyle(fontSize: 20),),
                         title: Text(_foundItems[index]['name'],style: TextStyle(color: Colors.white,fontSize: 15),),
                       ),
                     ),
                   ),
                 );

               }
           ):Text("No result fund",style: TextStyle(color: Colors.white),),

         )


         /* Expanded(
            child: ListView.builder(
                //itemCount: _foundItem.length,
                itemCount: 5,
                itemBuilder: (context,index){
                  return ListTile(
                    //title: Text(_foundItem[index]['name']),
                    title: Text('Akash Ahamed'+index.toString()),
                    // subtitle: Text(),
                  );
                } ),
          ),*/

          //2nd Item start
          /*Container(
              height: 60.0,
              //color: Colors.amberAccent,
               // padding: EdgeInsets.all(_minimumPadding *2),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(color: Colors.white,fontSize:16.0 ),
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        hintText: "Enter the Class Name",
                        hintStyle: TextStyle(color: Colors.white70,fontSize: 13.0),

                        border: myborder(),
                        enabledBorder: myborder(),
                        focusedBorder: myborder(),
                      )
                  ),
                ),
              ),*/
          //2nd Item End
        ],
      ),
    );
  }
  //Input Border start
  OutlineInputBorder myborder() {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(40.0),

        borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        )
    );
    //Input Border End

  }

//Search field delegate start

//Search field delegate start

}





