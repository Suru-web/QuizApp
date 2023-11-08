import 'package:flutter/material.dart';
import 'package:quiz/text_style.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        backgroundColor: Colors.red.shade700,
        elevation: 12,
        fixedSize: const Size(0, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: StyleText(Colors.white70, answerText, 20),
    );
  }
}
