import 'package:Ishara_final_version_1/screens/select_items_screen.dart';
import 'package:flutter/material.dart';
//import 'package:tflite_image_classification/TfliteModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TfliteModel(),
    );
  }
}

*/

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  //Hide the Bottom and Top navigation bar
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky, // Bar comes only when user scroll and after few second disappear.
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: SelectItemsScreen(),
    );
  }
}