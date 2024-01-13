
class Question{
  final String question;
  final List<String> options;
  final int correctanswerIndex;

  const Question({
    required this.correctanswerIndex,
    required this.question,
    required this.options,
});
}