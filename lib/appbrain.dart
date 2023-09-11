import 'package:quiz/question.dart';

class AppBrain {
  var _questionsNumber = 0;
  List<Question> _questiongroup = [
    Question(
      questionText: 'is this Cristiano Ronaldo?',
      imageQst: 'images/football1.jpg',
      answerQst: true,
    ),
    Question(
      questionText: 'is this maradona ?',
      imageQst: 'images/football2.jpg',
      answerQst: false,
    ),
    Question(
      questionText: 'is this messi?',
      imageQst: 'images/football3.jpg',
      answerQst: true,
    ),
    Question(
      questionText: 'did this player won the champions league?',
      imageQst: 'images/football4.png',
      answerQst: true,
    ),
  ];
  void nextQuestion() {
    if (_questionsNumber < _questiongroup.length - 1) {
      _questionsNumber++;
    }
  }

  String getquestintext() {
    return _questiongroup[_questionsNumber].questionText;
  }

  String getimages() {
    return _questiongroup[_questionsNumber].imageQst;
  }

  bool getanswers() {
    return _questiongroup[_questionsNumber].answerQst;
  }

  bool isfinished() {
    if (_questionsNumber >= _questiongroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionsNumber = 0;
  }
}
