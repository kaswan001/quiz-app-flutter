import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultScreen extends StatelessWidget{
  final List<String> chosenAnswers;

  const ResultScreen({super.key, required this.chosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for(int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index' : i,
          'questions' : questions[i].text,
          'correct_answer' : questions[i].answers[0],
          'user_answer' : chosenAnswers[i]
        }
      ); 
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where(
      (data) {
        return data['correct_answer'] == data['user_answer'];
      }
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have correctly answered $numCorrectAnswers out of $numTotalQuestions questions!!!'),
            SizedBox(height: 30,),
            QuestionSummary(summaryData: summaryData),
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {} ,
              child: Text('Restart Quiz')
            ),
          ],
        ),
      )
    );
  }
}