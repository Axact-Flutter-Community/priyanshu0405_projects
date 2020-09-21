import 'ques.dart';

class QuizMain {
  int quesNo = 0;
  List<Ques> quesBank = [
    Ques('The star sign Aquarius is represented by a tiger', true),
    Ques('Marrakesh is the capital of Morocco', false),
    Ques('Gin is typically included in a Long Island Iced Tea', true),
    Ques('The unicorn is the national animal of Scotland', true),
    Ques('There are 219 episodes of Friends', false),
    Ques('There are five different blood groups', false),
    Ques('\'A\' is the most common letter used in the English language', false),
    Ques('Australia is wider than the moon', true),
    Ques('A lion\'s roar can be heard up to eight kilometres away', true),
    Ques('Monaco is the smallest country in the world', false),
  ];

  void next() {
    if (quesNo < quesBank.length - 1) quesNo++;
  }

  String getQues() {
    return quesBank[quesNo].quesText;
  }

  bool getAns() {
    return quesBank[quesNo].ans;
  }

  void reset() {
    quesNo = 0;
  }

  bool isFinished() {
    if (quesNo >= quesBank.length - 1) {
      print('t');
      return true;
    } else {
      print('f');
      return false;
    }
  }
}
