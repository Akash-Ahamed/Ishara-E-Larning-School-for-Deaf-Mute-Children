import 'package:flutter/cupertino.dart';

class AlphabetPage extends StatefulWidget {
  const AlphabetPage({Key? key}) : super(key: key);

  @override
  State<AlphabetPage> createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is alphabet Page"),
    );
  }
}
