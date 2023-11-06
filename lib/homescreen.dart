import 'package:flutter/material.dart';
import 'package:quiz/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.quizStart, {super.key});
  final void Function() quizStart;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 193, 7),
          ),
          const SizedBox(
            height: 80,
          ),
          const StyleText(Colors.white, "Learning Flutter in a fun way", 24),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 200, 0),
                padding: const EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(120),
                )),
            onPressed: quizStart,
            label: const StyleText(Colors.black, "Start Quiz", 16),
            icon:
                const Icon(Icons.arrow_forward_rounded, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
