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
  /// ikonkalar
  List<Widget> icons = <Widget>[];

  /// tuura ikonka
  Widget correctIcon = const Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff4CAF4F),
    ),
  );

  /// kata ikonka
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

    algachkySuroonuAlipKel();
  }

  void algachkySuroonuAlipKel() {
    suroo = quizBrain.getQuestion();
  }

  /// koldonuuchu joop berdi
  userAsnwered(bool userAnswer) {
    /// tuuraJoop = realAsnwer
    bool realAsnwer = quizBrain.getAnswer();

    if (userAnswer == realAsnwer) {
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
    /// _height ichinde, sebebi kurup bashtaganda kana
    /// telefondun razmerin ala alat
    final _height = MediaQuery.of(context).size.height;
    //
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Stack(
            children: [
              const SizedBox(), // ZoomWidget()
              Positioned(
                top: _height / 3,
                left: 2,
                right: 2,
                child: Text(
                  suroo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              /// isFinished == true
              /// kiska jolu: isFinished
              ///
              /// isFinished == false
              /// kiska jolu: !isFinished
              if (isFinished)
                Positioned(
                  bottom: _height * 0.2,
                  child: CustomButton(
                      buttonText: 'kayradan bashta',
                      onPressed: () {
                        quizBrain.reset();
                        suroo = quizBrain.getQuestion();
                        isFinished = false;
                        icons = <Widget>[];
                        setState(() {});
                      }),
                )
              else
                Positioned(
                  bottom: _height * 0.05,
                  child: Column(
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
                    ],
                  ),
                ),

              /// ikonkalar
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    children: icons,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// DRY
