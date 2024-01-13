
import 'package:flutter/material.dart';
import 'package:quiz_pp/answer_card.dart';
import 'package:quiz_pp/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value){
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctanswerIndex){
      score++;
    }
    setState(() {

    });
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length -1){
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {


    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[0];
    bool isLastQuestion = questionIndex == questions.length -1;
    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Colors.teal,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(question.question,
          style: TextStyle(
            fontSize: 21,
          ),
          textAlign: TextAlign.center,
          ),

          ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: selectedAnswerIndex == null ?
                  () => pickAnswer(index) : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: false,
                    selectedAnswerIndex: 0,
                    correctAnswerIndex: question.correctanswerIndex,
                  ),
                );
              },
              ),



        ],
      ),
    );
  }
}
