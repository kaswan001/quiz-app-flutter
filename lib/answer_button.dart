import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  final String answerText;
  final void Function() onTap;

  const AnswerButton(this.answerText, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onTap, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 51, 3, 93),
              foregroundColor: const Color.fromARGB(255, 245, 243, 243)
            ),
            child: Text(answerText, textAlign: TextAlign.center,)
          );
  }
}