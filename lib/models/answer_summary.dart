class AnswerSummary {
  final int noCorrectAnswers;
  final int totalQuestions;
  final List<Map<String, Object>> answerSummaryList;

  const AnswerSummary({
    required this.noCorrectAnswers,
    required this.totalQuestions,
    required this.answerSummaryList,
  });
}
