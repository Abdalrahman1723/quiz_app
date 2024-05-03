import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/welcome.dart';

//-----------------------------------------
void main() => runApp(const MyApp());

//-----------------------------------------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
//-----------------------------------------

class _MyAppState extends State<MyApp> {
  //-------------------------
  int _questionIndex = -1;
  int _totalScore = 0;

  //-------------------------questions

  final List<Map<String, Object>> _question = <Map<String, Object>>[
    {
      'questionText': "What's the name of tallest mountain in the world?", //1
      'answer': [
        {'text': 'Everest', 'score': 10}, //correct
        {'text': 'Saint Catherine', 'score': 0},
        {'text': 'Amazons', 'score': 0},
        {'text': 'Fuji', 'score': 0},
      ]
    },
    {
      'questionText': "How many oceans on earth?", //2
      'answer': [
        {'text': '3', 'score': 0},
        {'text': '7', 'score': 0},
        {'text': '5', 'score': 10}, //correct
        {'text': '9', 'score': 0}
      ]
    },
    {
      'questionText': "Who won champions league of 2003?", //3
      'answer': [
        {'text': 'FCB', 'score': 0},
        {'text': 'RMA', 'score': 0},
        {'text': 'LIV', 'score': 0},
        {'text': 'AC Milan', 'score': 10} //correct
      ]
    },
    {
      'questionText': "What is the biggest country in the world?", //4
      'answer': [
        {'text': 'Russia', 'score': 10}, //correct
        {'text': 'China', 'score': 0},
        {'text': 'Algeria', 'score': 0},
        {'text': 'USA', 'score': 0},
      ]
    },
    {
      'questionText': "What is the name of biggest planet?", //5
      'answer': [
        {'text': 'Pluto', 'score': 0},
        {'text': 'Uranus', 'score': 0},
        {'text': 'Saturn', 'score': 0},
        {'text': 'Jupiter', 'score': 10}, //correct
      ]
    },
    {
      'questionText': "How many planets in solar system?", //6
      'answer': [
        {'text': '6', 'score': 0},
        {'text': '8', 'score': 10}, //correct
        {'text': '9', 'score': 0},
        {'text': '11', 'score': 0},
      ]
    },
    {
      'questionText': "What is the tallest tower in the world?", //7
      'answer': [
        {'text': 'Evil tower', 'score': 0},
        {'text': 'Pisa tower', 'score': 0},
        {'text': 'Amr Deiab', 'score': 0},
        {'text': 'Khalifa tower', 'score': 10}, //correct
      ]
    },
    {
      'questionText': "What is the chemical symbol of Iron ?", //8
      'answer': [
        {'text': 'In', 'score': 0},
        {'text': 'Fe', 'score': 10}, //correct
        {'text': 'Ir', 'score': 0},
        {'text': 'Fn', 'score': 0},
      ]
    },
    {
      'questionText': "What is the capital of Turkey?", //9
      'answer': [
        {'text': 'Ankara', 'score': 10}, //correct
        {'text': 'Istanbul', 'score': 0},
        {'text': 'Qustantine', 'score': 0},
        {'text': 'Turkey', 'score': 0},
      ]
    },
    {
      'questionText': "Who won 1990 world cup?", //10
      'answer': [
        {'text': 'France', 'score': 0},
        {'text': 'Italy', 'score': 0},
        {'text': 'Germany ', 'score': 10}, //correct
        {'text': 'Brazil', 'score': 0},
      ]
    },
    {
      'questionText': "bonus question : Who is the best football ever ?",
      //bonus
      'answer': [
        {'text': 'Messi', 'score': 10}, //correct
        {'text': 'Maradona', 'score': 0},
        {'text': 'Pele ', 'score': 10},
        {'text': 'Cristiano Ronaldo', 'score': -5},
      ]
    },
  ];

  //------------------------------ chose answer
  _choseAnswer(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 9; //!/----------------------------
    });
  }

  //------------------------------ reset quiz
  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  //------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quiz App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              //for the image background
              margin: const EdgeInsets.all(0),
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.deepPurpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            if (_questionIndex == -1)
              Welcome(qIndex: _questionIndex, inc: _choseAnswer)
            else if (_questionIndex < _question.length)
              Quiz(
                  question: _question,
                  questionIndex: _questionIndex,
                  choseAnswer: _choseAnswer)
            else
              Result(
                reset: _resetQuiz,
                result: _totalScore,
              ),
          ],
        ),
        floatingActionButton: _questionIndex >= _question.length
            ? SizedBox(
                width: 140,
                child: FloatingActionButton(
                  onPressed: () => setState(() {}),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Text("See Answers"),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
