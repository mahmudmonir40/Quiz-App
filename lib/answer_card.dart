import 'package:flutter/material.dart';

// if (no options is chosen)
// all answer cards should have default style
// all buttons should be enabled
// else
// all button should be disabled
// if ( currect option is chosen)
// answer should be highlighted as green
// else
// answer should be highlighted as green

class AnswerCard extends StatelessWidget {
  AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 30
      ),
        child:
      // selectedAnswerIndex != null?
          Container(
          height: 70,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  isCorrectAnswer
                  ? Colors.green
                  : isWrongAnswer
                      ? Colors.red
                      : Colors.white24,
            ),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(question,
                  style: const TextStyle(
                    fontSize: 16,),
                )
            ),
            SizedBox(height: 10),
              isCorrectAnswer
                  ? buildCorrectIcon()
                  : isWrongAnswer
                  ? buildWrongIcon()
                  : const SizedBox.shrink(),

          ],
        ),
      ),
      );
  }
}


   Widget buildCorrectIcon() => CircleAvatar(
     radius: 15,
     backgroundColor: Colors.green,
     child: Icon(
       Icons.check,
       color: Colors.white,
     ),
   );


    Widget buildWrongIcon() => CircleAvatar(
    radius: 15,
     backgroundColor: Colors.red,
     child: Icon(
    Icons.close,
    color: Colors.white,
  ),
);
