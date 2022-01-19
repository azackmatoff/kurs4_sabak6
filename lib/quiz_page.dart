import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs4_sabak6/custom_button.dart';
import 'package:kurs4_sabak6/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> icons = <Widget>[];

  Widget correctIcon = const Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff4CAF4F),
    ),
  );
  Widget wrongIcon = const Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: FaIcon(
      FontAwesomeIcons.times,
      color: Color(0xffF44336),
    ),
  );

  String suroo = 'Suroo';
  //suroo buttu, ayagina chikti

  bool isFinished = false;

  @override
  void initState() {
    super.initState();

    suroo = quizBrain.getQuestion();
  }

  /// koldonuuchu joop berdi
  userAsnwered(bool answer) {
    log('userAsnwered.answer ===> $answer');

    /// tuuraJoop = realAsnwer
    bool realAsnwer = quizBrain.getAnswer();

    log('answer == realAsnwer: ${answer == realAsnwer}');

    if (answer == realAsnwer) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }

    quizBrain.getNext();
    suroo = quizBrain.getQuestion();

    if (suroo == 'buttu') {
      isFinished = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 35.0),
              Text(
                suroo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                ),
                textAlign: TextAlign.center,
              ),
              if (isFinished == true)
                CustomButton(
                    buttonText: 'kayradan bashta',
                    onPressed: () {
                      quizBrain.reset();
                      suroo = quizBrain.getQuestion();
                      isFinished = false;
                      icons = <Widget>[];
                      setState(() {});
                    })
              else
                Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        userAsnwered(true);
                      },
                      buttonText: 'Туура',
                      bgColor: const Color(0xff4CAF4F),
                    ),
                    const SizedBox(height: 20.0),
                    CustomButton(
                      onPressed: () => userAsnwered(false),
                      buttonText: 'Туура эмес',
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: icons,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// DRY
