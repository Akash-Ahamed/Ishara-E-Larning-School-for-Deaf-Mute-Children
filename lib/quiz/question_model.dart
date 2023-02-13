
import 'dart:ui';

class Question{
  final String id;
  final String title;
  final Map<String, bool> options;
  final String image;

  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.image,
  });

  @override
  String toString(){
    return 'Question(id: $id,title: $title, options: $options,image:$image)';
  }
}