import 'package:flutter/material.dart';


class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestion}) : super(key: key);

  final String question;
  final int indexAction;
  final totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('প্রশ্ন:${indexAction +1 }/$totalQuestion:$question',
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            decoration: TextDecoration.none,
        ),
      ),
    );
  }
}