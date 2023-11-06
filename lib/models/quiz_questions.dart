class QuizQuestion {
  QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> shuffleList() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}