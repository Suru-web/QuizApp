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
var questionNum = 1;
var numberOfQuestions = 0;

class _QuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(context) {
    var currentQuestion = questions[currentIndex];
    numberOfQuestions = questions.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: StyleText(Colors.white, "Question Number $questionNum", 21),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      isAntiAlias: true,
                      currentQuestion.imageAsset,
                      width: constraints.maxWidth * 0.7,
                    ),
                    const SizedBox(height: 30),
                    StyleText(
                      Colors.black,
                      currentQuestion.question,
                      24,
                    ),
                    const SizedBox(height: 30),
                    ...currentQuestion.shuffleList().map((answer) {
                      return Container(
                        width: constraints.maxHeight * 0.4,
                        margin: const EdgeInsets.only(
                          bottom: 30,
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
            ),
          );
        },
      ),
    );
  }

  void saveAns() {
    if (currentIndex < numberOfQuestions - 1) {
      setState(() {
        currentIndex++;
        questionNum++;
      });
    }
  }
}
