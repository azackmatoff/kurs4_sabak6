import 'dart:developer';

import 'package:kurs4_sabak6/quiz_model.dart';

class QuizBrain {
  int _index = 0;
  // questionsAndAnswers = suroolor jana jooptor
  List<QuizModel> questionsAndAnswers = <QuizModel>[
    QuizModel(question: 'Batken Ozgon oblastina karashtuu!', answer: false),
    QuizModel(question: 'Bishkek 2-chi chon shaar', answer: false),
    QuizModel(question: 'Kirgizstan egemenduu olko', answer: true),
  ];

  String getQuestion() {
    log('questionsAndAnswers.length: ${questionsAndAnswers.length}');

    if (_index < questionsAndAnswers.length) {
      log('getQuestion._index: $_index');
      log('question: ${questionsAndAnswers[_index].question}');
      return questionsAndAnswers[_index].question;
    } else {
      return 'buttu';
    }
  }

  void getNext() {
    _index++;
    log('_index: $_index');
  }

  bool getAnswer() {
    if (_index <= questionsAndAnswers.length) {
      return questionsAndAnswers[_index].answer;
    }
  }

  void reset() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
