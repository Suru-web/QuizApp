import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/text_style.dart';
import 'package:quiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectAnswer});
  final void Function(String answer) selectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

var currentIndex = 0;
var questionNum = 1;
var numberOfQuestions = 0;
int totalCorrectAnswer = 0;
List<String> putAnswersChecking = [];

class _QuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(context) {
    var currentQuestion = questions[currentIndex];
    numberOfQuestions = questions.length;

    return Scaffold(
      backgroundColor: Colors.white,
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
                  mainAxisSize: MainAxisSize.max,
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
                          onTap: () {
                            saveAns(answer);
                          },
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

  void saveAns(String selectedAnswer) {
    widget.selectAnswer(selectedAnswer);
    if (putAnswersChecking.length < 10) {
      print("hello");
      putAnswersChecking.add(selectedAnswer);
    }

    if (currentIndex < numberOfQuestions - 1) {
      setState(() {
        currentIndex++;
        questionNum++;
      });
    } else if (currentIndex <= numberOfQuestions) {
      print(countAnswers());
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ResultScreen(),
            settings: RouteSettings(arguments: putAnswersChecking)),
      );
    }
  }

  int countAnswers() {
    int count = 0;
    for (int i = 0; i < numberOfQuestions; i++) {
      if (questions[i].answers[0] == putAnswersChecking[i]) {
        count++;
      }
    }
    return count;
  }
}
