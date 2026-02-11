import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {

  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  } 
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState( () {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer,);
    } 

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 Color.fromARGB(255, 78, 13, 151),
                 Color.fromARGB(255, 107, 15, 168)
              ],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}