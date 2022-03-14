import 'package:kurs4_sabak6/data/services/quiz_services.dart';

class QuizRepository {
  String getQuestion() {
    return quizServices.getQuestion();
  }

  void getNext() {
    quizServices.getNext();
  }

  bool getAnswer() {
    return quizServices.getAnswer();
  }

  void reset() {
    quizServices.reset();
  }
}

/// instance
final QuizRepository quizRepository = QuizRepository();
