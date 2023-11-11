import 'package:flutter/material.dart';
import 'package:quiz/homescreen.dart';
import 'package:quiz/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

const backGroundColor = Color(0xffE0F4FF);

class _QuizAppState extends State<QuizApp> {
  var currentScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      currentScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: currentScreen == 'start-screen'
            ? HomeScreen(switchScreen)
            : QuestionScreen(selectAnswer: (String answer) {}),
      ),
    );
  }
}
