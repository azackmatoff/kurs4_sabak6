import 'package:kurs4_sabak6/data/local_data/quiz/question_data.dart';

class QuizServices {
  int _index = 0;

  String getQuestion() {
    if (_index < QuestionData.questionsAndAnswers.length) {
      return QuestionData.questionsAndAnswers[_index].question;
    } else {
      return 'buttu';
    }
  }

  void getNext() {
    _index++;
  }

  bool getAnswer() {
    if (_index <= QuestionData.questionsAndAnswers.length) {
      return QuestionData.questionsAndAnswers[_index].answer;
    }
  }

  void reset() {
    _index = 0;
  }
}

final QuizServices quizServices = QuizServices();
