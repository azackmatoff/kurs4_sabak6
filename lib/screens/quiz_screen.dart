import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kurs4_sabak6/app_constants/colors/app_colors.dart';
import 'package:kurs4_sabak6/app_constants/text_styles/app_text_styles.dart';
import 'package:kurs4_sabak6/data/repository/quiz_repository.dart';
import 'package:kurs4_sabak6/widgets/custom_button.dart';

import 'package:kurs4_sabak6/widgets/icon_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  /// ikonkalar
  List<Widget> icons = <Widget>[];

  /// tuura ikonka
  Widget correctIcon = const IconWidget(
    icon: FontAwesomeIcons.check,
    iconColor: AppColors.mainColor,
  );

  /// kata ikonka
  Widget wrongIcon = const IconWidget(
    icon: FontAwesomeIcons.times,
    iconColor: AppColors.secondaryColor,
  );

  String _suroo = 'Suroo';
  //suroo buttu, ayagina chikti

  bool _isFinished = false;

  @override
  void initState() {
    super.initState();

    _getFirstQuestion();
  }

  @override
  Widget build(BuildContext context) {
    /// _height ichinde, sebebi kurup bashtaganda kana
    /// telefondun razmerin ala alat
    final _height = MediaQuery.of(context).size.height;

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
                  _suroo,
                  style: AppTextStyles.content,
                  textAlign: TextAlign.center,
                ),
              ),

              /// isFinished == true
              /// kiska jolu: isFinished
              ///
              /// isFinished == false
              /// kiska jolu: !isFinished
              if (_isFinished)
                Positioned(
                  bottom: _height * 0.2,
                  child: CustomButton(
                    buttonText: 'kayradan bashta',
                    onPressed: _reset,
                  ),
                )
              else
                Positioned(
                  bottom: _height * 0.05,
                  child: Column(
                    children: [
                      CustomButton(
                        onPressed: () {
                          _userAsnwered(true);
                        },
                        buttonText: 'Туура',
                        bgColor: const Color(0xff4CAF4F),
                      ),
                      const SizedBox(height: 20.0),
                      CustomButton(
                        onPressed: () => _userAsnwered(false),
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

  void _getFirstQuestion() {
    _suroo = quizRepository.getQuestion();
  }

  /// koldonuuchu joop berdi
  _userAsnwered(bool userAnswer) {
    /// tuuraJoop = realAsnwer
    bool realAsnwer = quizRepository.getAnswer();

    if (userAnswer == realAsnwer) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }

    quizRepository.getNext();
    _suroo = quizRepository.getQuestion();

    if (_suroo == 'buttu') {
      _isFinished = true;
    }

    setState(() {});
  }

  void _reset() {
    quizRepository.reset();
    _suroo = quizRepository.getQuestion();
    _isFinished = false;
    icons = <Widget>[];
    setState(() {});
  }
}

/// DRY
