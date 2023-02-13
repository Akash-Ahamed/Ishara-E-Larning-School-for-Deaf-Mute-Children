import 'dart:async';

import 'package:Ishara_final_version_1/screens/search_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool>isSidebarOpenedStream;
  late StreamSink<bool>isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  //Animation methods start
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }
  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }
  //Animation methods end

  //onIconPressed Method start
  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = (animationStatus == AnimationStatus.completed);

    if(isAnimationCompleted){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }

  }
  //onIconPressed Method end
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final safeArea =
    EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top, left: MediaQuery.of(context).viewPadding.left);

    return StreamBuilder<bool>(
      initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context,isSideBarOpenedAsync){
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ! ? 0: -screenWidth,
            right: isSideBarOpenedAsync.data ! ? screenWidth *0.63: screenWidth-95 ,
           child: Row(

              children: [
                Expanded(
                  child: Container(  // top to bottom bar
                    //color: Color(0xFF03045e),
                    color: Colors.red,

                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            //Navigation Item.
                            //head Part start

                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10).add(safeArea),
                              width: double.infinity,
                              //height: double.infinity,
                              color: Colors.white10,
                              child:ListTile(
                                title: Text(
                                  'ISHARA',
                                  style: TextStyle(color: Colors.white,fontSize: 30),
                                ),
                                subtitle: Text(
                                  'E-LEARNING SCHOOL',
                                  style: TextStyle(color: Colors.white,fontSize: 10),
                                ),
                                leading: Image.asset('images/logo.png'),

                                /* leading: CircleAvatar(
                                  child: Image.asset('images/logo.png',width: 100,height: 100,),
                                  radius: 30,
                                ),*/
                              ) ,

                            ),
                            //head Part end

                            //Divider part Start
                            Divider(
                              color: Colors.white,
                              thickness: 0.2,
                              height: 5,
                              indent: 0,
                              endIndent: 0,
                            ),
                            //Divider Part End


                            //Sidebar Menu Items Start
                          SearchMenu(),
                            //Sidebar Menu Item End
                          ],
                        ),
                      ),

                  ),
                ),

                Align(
                  alignment: Alignment(0,-0.7),
                  //Check the menu and cross icon was tap or not tap.
                  child: GestureDetector(
                    onTap: (){
                      onIconPressed();
                    },
                    child: Container(
                      width: 35,
                      height: 110,
                     // color: Color(0xFF03045e),
                      color: Colors.red, //***********
                      // Animation Icon according to the Animation Controller
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),

                    ),
                  ),
                ),
              ],
            ),
          );

        },
        );


  }
}
