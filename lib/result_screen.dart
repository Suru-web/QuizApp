import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/text_style.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ));
    String excitement = "";
    String imageAsset = "";
    int count = 0;
    final gotAnswer =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    final List<bool> correctAns = [];
    for (int i = 0; i < gotAnswer.length; i++) {
      if (questions[i].answers[0] == gotAnswer[i]) {
        correctAns.add(true);
        count++;
      } else {
        correctAns.add(false);
      }
    }
    if (count >= 7) {
      excitement = "Yay!!! Take this Trophy";
      imageAsset = "assets/images/trophy.png";
    } else {
      excitement = "Better luck next time :(";
      imageAsset = "assets/images/allthebest.png";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        title: const StyleText(Colors.black, "Results", 24),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          StyleText(Colors.black, excitement, 28),
          const SizedBox(
            height: 10,
          ),
          Image.asset(imageAsset, width: 100),
          const SizedBox(
            height: 20,
          ),
          StyleText(Colors.black, "Your score is $count/10", 24),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10, right: 10),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 0, right: 0),
                      title: StyleText(Colors.black,
                          "${index + 1} ) ${questions[index].question}", 22),
                      horizontalTitleGap: 20,
                      subtitle: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          StyleText(
                              Colors.black,
                              "Correct Answer : ${questions[index].answers[0]}",
                              20),
                          const SizedBox(
                            height: 5,
                          ),
                          StyleText(
                              correctAns[index] == true
                                  ? Colors.green
                                  : Colors.red,
                              "Your Answer : ${gotAnswer[index]}",
                              20),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
