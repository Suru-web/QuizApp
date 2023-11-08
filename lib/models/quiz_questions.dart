class QuizQuestion {
  QuizQuestion(this.question, this.answers, this.imageAsset);
  final String question;
  final List<String> answers;
  final String imageAsset;

  List<String> shuffleList() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
