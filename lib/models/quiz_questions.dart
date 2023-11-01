class QuizQuestions {
  const QuizQuestions(this.question, this.answers);
  final String question;
  final List<String> answers;
  List<String> getShuffuledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}