import 'package:flutter/material.dart';
import '../colors/colors.dart';


import '../Mathematich/number_dispaly_page.dart';
import '../Modal/number_data_modal.dart';

class SelectItemsHomeScreen extends StatefulWidget {
  const SelectItemsHomeScreen({Key? key}) : super(key: key);


  @override
  State<SelectItemsHomeScreen> createState() => _SelectItemsHomeScreenState();
}

class _SelectItemsHomeScreenState extends State<SelectItemsHomeScreen> {
  final _minimumPadding = 5.0;
  final marg = 5.0;
  bool _value = false;

  double boxH = 240.0;
  double boxW = 210.0;


  //ImageName List Start
  //static List<String> ImageName = ['Zero','One','Two','Three'];
  static List<String> ImageName = ['শূন্য','এক','দুই','তিন','চার','পাঁচ'];
  //ImageName List End

  //Image List Start
  static List<String> ImageIcon =[
    'images/Zero.png',
    'images/One.png',
    'images/Two.png',
    'images/Three.png',
    'images/Four.png',
    'images/Five.png',
  ];
  //Image List End

  static List<String> ImageSymbol =[
    'images/ZeroSymbol.png',
    'images/OneSymbol.png',
    'images/TwoSymbol.png',
    'images/ThreeSymbol.png',
    'images/OneSymbol.png',
    'images/TwoSymbol.png',
  ];

  final List<NumberDataModel> Numberdata = List.generate(ImageName.length, (index) => NumberDataModel( '${ImageName[index]}', '${ImageIcon[index]}', '${ImageSymbol[index]}',));

  get index => 0;
  @override
  Widget build(BuildContext context) {
//If need selete subject overflow remove then add singlechildeschorlview
    return Stack(


      children: [
        Column(
          children: [
            //Title and Image
            Container(


              //color: mauve, //***********Background colors 1
              child: Row(
                children: [
                  //Image Item Start
                  geHeaderBox(),
                  //Image Item End
                ],
              ),
            ),
            SizedBox(height: 25.0),
            //Scrolling Parts Start
            Container(
                height: 200.0,
               // color: Colors.white,  //*********************
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    getSubjectBox(
                      0,
                      'tiger.png',
                      'গণিত',
                      'গাণিতিক সংখ্যা, আকৃতি এবং প্রতীক',
                      //Colors.deepOrange,
                      //Color(0xFFADD8E6),
                      Color(0xFF0000FF),
                      Colors.white,
                      Colors.white,
                        Color(0xFF0000FF)
                    ),
                    getSubjectBox(
                        1,
                        'rabit.png',
                        'বর্ণমালা',
                        'ইংরেজি বর্ণমালার সাংকেতিক প্রতীক.',
                      Color(0xFF0000FF),
                        Colors.white,
                        Colors.white,
                      Color(0xFFADD8E6),
                    ),
                    getSubjectBox(
                        2,
                        'tiger.png',
                        'অনির্ধারিত',
                        'এই বিষয়টি এখনও নির্ধারণ করা হয়নি।',
                      Color(0xFF0000FF),
                        Colors.white,
                        Colors.white,
                      Color(0xFF0000FF),
                    ),
                    getSubjectBox(
                        3,
                        'rabit.png',
                        'অনির্ধারিত',
                        'এই বিষয়টি এখনও নির্ধারণ করা হয়নি। ',
                      Color(0xFF0000FF),
                        Colors.white,
                        Colors.white,
                      Color(0xFFADD8E6),
                    ),

                  ],
                ),
              ),
            //Scrolling Parts End

          ],
        ),
        Positioned(
          bottom: -5,
          child: Container(
            height: boxH,
            color: Colors.yellow,
          ),
        ),
        /*Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: boxH,
              //height: 200.0,
              color: Colors.redAccent,
            ),
        ),*/
      ],
    );
   /* Container(
      //color: Colors.redAccent,
     // color: Color(0xFFff431b), //Background colors
      color: Colors.black,
      child: Column(
        children: [
          //Title and Image
          Container(
            child: Row(
              children: [
                //Image Item Start
                geHeaderBox(),
                //Image Item End
              ],
            ),
          ),
          SizedBox(height: 10.0),

          //Scrolling Parts Start
          GestureDetector(
            child: Container(


              height: boxH,

              color: Colors.white,
              child: ListView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  getSubjectBox(
                      0,
                      'tiger.png',
                      'Mathematich',
                      'Ishara Provide mathematich number, shape, symbol',
                      Colors.deepOrange,
                      Colors.white,
                      Colors.white,
                  ),
                  getSubjectBox(
                    1,
                    'rabit.png',
                    'English',
                    'Ishara Provide mathematich number, shape, symbol',
                    Colors.yellowAccent,
                    Colors.black,
                    Colors.black
                  ),
                  getSubjectBox(
                      2,
                      'tiger.png',
                      'Mathematich',
                      'Ishara Provide mathematich number, shape, symbol',
                      Colors.deepPurpleAccent,
                      Colors.white,
                      Colors.white
                  ),
                  getSubjectBox(
                      3,
                      'rabit.png',
                      'English',
                      'Ishara Provide mathematich number, shape, symbol',
                      Colors.deepOrange,
                      Colors.black,
                      Colors.black
                  ),

                ],
              ),
            ),
          ),
          //Scrolling Parts End
        ],
      ),
    );*/
  }
//////////////////
  //Subject Page Start

  //Subject Page End

  //Header Image & Title Start
  Container geHeaderBox() {

    return Container(
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width *0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        //color: Colors.black
      ),
      margin: EdgeInsets.only(left: marg*20, top: MediaQuery.of(context).viewPadding.top),
      child: Stack(
        children: [
          Positioned(
            // left: -20,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(
                image: AssetImage("images/logo1.png"),
                height: MediaQuery.of(context).size.height/3.0,
              ),
            ),
          ),

          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        //"Pre-School",
                        "প্রাক-বিদ্যালয়",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      margin: EdgeInsets.only(left: 150.0),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 150.0),
                  child: Text(
                   /* "Ishara E-learning school offers more than 50 Pre-school sign language "
                        "material skills to explore and learn",*/
                    "ইশারা ই-লার্নিং স্কুল অন্বেষণ এবং শেখার জন্য একাধিক বিষয়ের প্রাক-স্কুল উপযুক্ত সাংকেতিক ভাষা প্রদান করে।",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //Header Image & Title End


//Get Subject select box Start
 Container getSubjectBox(
     int id,
     String imagName,
     String title,
     String subtitle,
     Color BoxColor,
     Color TitleColor,
     Color SubTitleColor,
     Color SubjectColor,

     ) {
    return Container(
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)
            ),
            context: context,
            isScrollControlled: false,
            //backgroundColor: Colors.deepPurple,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.black.withAlpha(1),
            builder: (BuildContext context){
              return  Container(
                  margin: EdgeInsets.only(left: 60.0),
                  height: boxH,
                  //color: Colors.red,
                  color: SubjectColor,
                    child: Column(
                      children: [
                        //Mathe subject header start
                        Container(
                          //color: Colors.yellow,
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                               // color: Colors.black,
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  iconSize: 35,
                                  icon: Icon(Icons.close,color: Colors.white),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 680,
                               // color: Colors.black,
                                padding:EdgeInsets.only(top: 5),
                                alignment: Alignment.center,
                                child: Text('গণিত',
                                  //SubjectName,
                                  style: TextStyle(
                                    color: Colors.white,
                                      //color: SubjectTextColor,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                              )

                            ],
                          ),
                        ),
                        //Mathe subject header end

                        //subject chapter body start
                       Container(
                         //color: Colors.white,
                          height: 150,   //Chapter Select box size
                         child: ListView(
                           scrollDirection: Axis.horizontal,
                           children: [
                             getSubjectChapterBox(
                               0,
                               'সংখ্যা',
                               Color(0xFFBB85AB),
                               Colors.white,
                             ),
                             getSubjectChapterBox(
                               1,
                               'আকৃতি',
                               Color(0xFFBB85AB),
                               Colors.white,
                             ),
                             getSubjectChapterBox(
                               2,
                               'প্রতীক',
                               Color(0xFFBB85AB),
                               Colors.white,
                             ),
                             getSubjectChapterBox(
                               1,
                               'Shape',
                               Color(0xFFBB85AB),
                               Colors.white,
                             ),
                           ],
                         ),

                       )
                        // subject chapter body end




                       /* ElevatedButton(
                          child: Text('Close'),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),*/
                       // Text('Mathe-0'),
                    ]
                    ),

                );
            },

          );
        },
        //Subject Container Start
        child: Container(

          //height: _value== false? MediaQuery.of(context).size.height/3: 500,
          height: MediaQuery.of(context).size.height/3,
         // width: _value== false? MediaQuery.of(context).size.width *0.3: 600,
          width: MediaQuery.of(context).size.width *0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: BoxColor,
          ),
          //margin: EdgeInsets.only(left: marg*15, top: MediaQuery.of(context).viewPadding.top),
          margin: EdgeInsets.only(left: 85, right: 15,top: 20.0),
          child: Stack(
            children: [
              Positioned(
                left: -65,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                 //******************************************************************************************************charatoon Image
                 /* child: Image(
                    image: AssetImage("images/$imagName"),
                    height: MediaQuery.of(context).size.height/2.5,
                  ),*/
                ),
              ),

              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50.0),
                          padding: EdgeInsets.only(top: _minimumPadding*2),
                          child: Text(
                            title,
                            style: TextStyle(
                               // color: Colors.white,
                              color: TitleColor,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        )
                      ],
                    ),
                    //Sub Title(information for every subject)
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      padding: EdgeInsets.only(top: _minimumPadding),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          //color: Colors.white,
                          color: SubTitleColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
            clipBehavior: Clip.none,
          ),
        ),
        //Subject Container End
      ),
    );

   /////////////////////
    //maine code start
    /*return Container(
      child: GestureDetector(
       /* onTap: (){
          //When tab a subject box
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>MathHomeScreen(id)));
          //new Container
        },*/
        //Subject Container Start
        child: Container(
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width *0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: BoxColor,
          ),
          //margin: EdgeInsets.only(left: marg*15, top: MediaQuery.of(context).viewPadding.top),
          margin: EdgeInsets.only(left: 85, right: 15,top: 20.0),
          child: Stack(
            children: [
              Positioned(
                left: -65,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage("images/$imagName"),
                    height: MediaQuery.of(context).size.height/2.5,
                  ),
                ),
              ),

              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50.0),
                          padding: EdgeInsets.only(top: _minimumPadding*2),
                          child: Text(
                            title,
                            style: TextStyle(
                               // color: Colors.white,
                              color: TitleColor,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        )
                      ],
                    ),
                    //Sub Title(information for every subject)
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      padding: EdgeInsets.only(top: _minimumPadding),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          //color: Colors.white,
                          color: SubTitleColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
            clipBehavior: Clip.none,
          ),
        ),
        //Subject Container End
      ),
    );*/
   //maine code end
}

//Math Subject Header Start
  Container getMathSubjectHeader() {
    return Container(
      width: 680,
      color: Colors.black,
      alignment: Alignment.center,
      child: Text('Mathematich',
        //SubjectName,
        style: TextStyle(
            color: Colors.white,
            //color: SubjectTextColor,
            fontSize: 35,
            fontWeight: FontWeight.bold),
      ),
    );
  }
//Math Subject Header Start

/////////////////////////////////////////
//Subject chapter Start
  Container getSubjectChapterBox(
      int id,
      //String imagName,
      String Chaptertitle,
      //String subtitle,
      Color BoxColor,
      Color ChapterTitleColor,
      //Color SubTitleColor,

      ) {
    return Container(
      child: GestureDetector(
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>NumberDetilePage(id)));
          
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NumberDisplayPage(index: index,numberDataModel: Numberdata) ));
        },
        //Subject Container Start
        child: Container(
          height: 200,
          width: 180,
          //height: MediaQuery.of(context).size.height / 5,
         // width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: BoxColor,
          ),
          //margin: EdgeInsets.only(left: marg*15, top: MediaQuery.of(context).viewPadding.top),
          margin: EdgeInsets.only(left: 30, right: 25, top: 20.0),
          child: Stack(
            children: [
              /*Positioned(
                left: -65,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage("images/$imagName"),
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),*/
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35.0,top: 20),
                          padding: EdgeInsets.only(top: _minimumPadding * 2),
                          child: Text(
                            Chaptertitle,
                            style: TextStyle(
                              // color: Colors.white,
                                color: ChapterTitleColor,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    //Sub Title(information for every subject)
                    /*Container(
                      margin: EdgeInsets.only(left: 50.0),
                      padding: EdgeInsets.only(top: _minimumPadding),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          //color: Colors.white,
                          color: SubTitleColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
            //clipBehavior: Clip.none,
          ),
        ),
        //Subject Container End
      ),
    );
//Subject chapter Start
  }
}

