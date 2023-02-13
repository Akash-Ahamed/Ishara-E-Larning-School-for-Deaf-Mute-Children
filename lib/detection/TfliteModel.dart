import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  
  late File _image;
  late List _results;
  bool imageSelect=false;
  @override
  void initState()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async {
    Tflite.close();
    String res;
    res=(await Tflite.loadModel(

        model: "assets/model_sign_techeable.tflite",
        labels: "assets/labels_sign_techable.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image)
  async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results=recognitions!;
      _image=image;
      imageSelect=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  body: ListView(

        children: [
          (imageSelect)?Container(
        margin: const EdgeInsets.all(10),
        child: Image.file(_image),
      ):Container(

        margin: const EdgeInsets.all(10),
            child: const Opacity(
              opacity: 0.8,
              child: Center(
                child: Text("No image selected"),
              ),
            ),
      ),
          SingleChildScrollView(
            child: Row(
              children: (imageSelect)?_results.map((result) {
                return Card(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.red,
                      fontSize: 20),
                    ),
                  ),
                );
              }).toList():[],

            ),
          )
        ],
      ),*/


      //

        body: Container(
          //width: MediaQuery.of(context).size.width*0.6,
          //height: 600,
          child: Row(children: [
            (imageSelect)?Container(
              margin: const EdgeInsets.all(10),
              child: Image.file(_image),
            ):Container(

              margin: const EdgeInsets.all(10),
              child: const Opacity(
                opacity: 0.8,
                child: Center(
                  child: Text("No image selected"),
                ),
              ),
            ),
            Column(
              children: (imageSelect)?_results.map((result) {
                return Card(
                  margin: EdgeInsets.only(top: 50,right: 30),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.red,
                          fontSize: 20),
                    ),
                  ),
                );
              }).toList():[],

            )
          ],),


        ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: SelectImage,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        tooltip: "Pick Image",
        heroTag: 'ছবি বাছাই করুন!',
        splashColor: Colors.yellow,
        hoverColor: Colors.red,
        icon: Icon(Icons.add_a_photo),
        label: Text('গ্যালারিতে প্রবেশ করুন।'),
      ),
    );
  }
  Future SelectImage()
  async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image=File(pickedFile!.path);
    imageClassification(image);
  }
}
