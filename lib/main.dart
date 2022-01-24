import 'package:flutter/material.dart';
import 'package:kurs4_sabak6/quiz_page.dart';
import 'package:kurs4_sabak6/sabaktar/stack_misal.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StackMisal(
        finalSoz: 'Suroo ushul jerge kelet asdfasfas asdas',
      ),
    );
  }
}
