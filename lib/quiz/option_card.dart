import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';


class OptionCard extends StatelessWidget {
  const OptionCard({Key? key,required this.option, required this.color}) : super(key: key);
  final String option;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Card(
        color: color,
        child:ListTile(
          title: Text(
            option,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25,
                color: color.red!= color.green? natural: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
