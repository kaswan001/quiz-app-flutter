import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;

  const QuestionScreen({super.key, required this.onSelectedAnswer});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context)  {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text, 
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 176, 176, 218),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            ), 
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map( (answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}