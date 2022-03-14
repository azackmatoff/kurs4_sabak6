import 'package:kurs4_sabak6/models/quiz_model.dart';

class QuizBrain {
  /// private
  int _index = 0;
  // questionsAndAnswers = suroolor jana jooptor
  final List<QuizModel> _questionsAndAnswers = <QuizModel>[
    QuizModel(question: 'Batken Ozgon oblastina karashtuu!', answer: false), //0
    QuizModel(question: 'Bishkek 2-chi chon shaar', answer: false), //1
    QuizModel(question: 'Kirgizstan egemenduu olko', answer: true), //2
  ];

  String getQuestion() {
    if (_index < _questionsAndAnswers.length) {
      return _questionsAndAnswers[_index].question;
    } else {
      return 'buttu';
    }
  }

  void getNext() {
    _index++;
  }

  bool getAnswer() {
    if (_index <= _questionsAndAnswers.length) {
      return _questionsAndAnswers[_index].answer;
    }
  }

  void reset() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
