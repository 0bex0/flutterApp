import 'question.dart';
import 'dart:math';

class QuizBrain {
  List<int> asked = [];

  int _questionNumber = Random().nextInt(47);

  List<Question> _questions = [
    Question(q: 'The star sign Aquarius is represented by a tiger', a: false),
    Question(q: 'Meryl Streep has only won two Academy Awards', a: false),
    Question(q: 'Marrakesh is the capital of Morocco', a: false),
    Question(
        q: 'Idina Menzel sings \'let it go\' less than 20 times in \'Let It Go\' from Frozen',
        a: false),
    Question(
        q: 'Waterloo has the greatest number of tube platforms in London',
        a: true),
    Question(q: 'M&M stands for Mars and Moordale', a: false),
    Question(q: 'Gin is typically included in a Long Island Iced Tea', a: true),
    Question(q: 'The unicorn is the national animal of Scotland', a: true),
    Question(
        q: 'There are two parts of the body that can\'t heal themselves',
        a: false),
    Question(q: 'Howard Donald is the oldest member of Take That', a: true),
    Question(
        q: 'The Great Wall of China is longer than the distance between London and Beijing',
        a: true),
    Question(q: 'There are 219 episodes of Friends', a: false),
    Question(
        q: '\'A\' is the most common letter used in the English language',
        a: false),
    Question(
        q: 'A lion\'s roar can be heard up to eight kilometres away', a: true),
    Question(q: 'In Harry Potter, Draco Malfoy has no siblings', a: true),
    Question(q: 'Louis Walsh is older than Simon Cowell', a: true),
    Question(q: 'Monaco is the smallest country in the world', a: false),
    Question(
        q: '\'What Do You Mean\' was Justin Bieber\'s first UK number one single',
        a: true),
    Question(
        q: 'The river Seine in Paris is longer than the river Thames in London',
        a: true),
    Question(q: 'A cara cara navel is a type of orange', a: true),
    Question(q: 'There are five different blood groups', a: false),
    Question(q: 'Cinderella was the first Disney princess', a: false),
    Question(q: 'ASOS stands for As Seen On Screen', a: true),
    Question(q: 'The Battle Of Hastings took place in 1066', a: true),
    Question(q: 'H&M stands for Hennes & Mauritz', a: true),
    Question(q: 'Canis lupur is the scientific name for a wolf', a: false),
    Question(q: 'K is worth four points in Scrabble', a: false),
    Question(
        q: 'Alaska is the biggest American state in square miles', a: true),
    Question(q: 'Ariana Grande is 25 or under', a: false),
    Question(q: 'Australia is wider than the moon', a: true),
    Question(
        q: 'Queen Elizabeth II is currently the second longest reigning British monarch',
        a: false),
    Question(q: 'Madonna\'s real name is Madonna', a: true),
    Question(
        q: 'Serena Williams has one more singles tennis Grand Slam titles than sister Venus',
        a: true),
    Question(q: 'Alexander Fleming discovered penicillin', a: true),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];

  void nextQuestion() {
    asked.add(_questionNumber);
    _questionNumber = Random().nextInt(47);
    while (asked.contains(_questionNumber)) {
      _questionNumber = Random().nextInt(47);
    }
  }

  bool isFinished() {
    if (asked.length == 13) {
      asked.clear();
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questions[_questionNumber].q;
  }

  bool getAnswer() {
    return _questions[_questionNumber].a;
  }
}
