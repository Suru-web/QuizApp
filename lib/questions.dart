import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/text_style.dart';
import 'package:quiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

var currentIndex = 0;
var numberOfQuestions = 0;

class _QuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(context) {
    var currentQuestion = questions[currentIndex];
    numberOfQuestions = questions.length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyleText(
              Colors.white,
              currentQuestion.question,
              24,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffleList().map((answer) {
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ), // Adjust the margin to control the spacing
                child: AnswerButton(
                  answerText: answer,
                  onTap: saveAns,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void saveAns() {
    if (currentIndex < numberOfQuestions - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }
}
