
import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class QuizResult extends StatelessWidget {
  final int correctCount;
  final int incorrectCount;
  final VoidCallback onRestartQuiz;

  QuizResult(
      {required this.correctCount,
      required this.incorrectCount,
      required this.onRestartQuiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context).isDarkMode ? Colors.black45 : Colors.white, // Background color
        borderRadius: BorderRadius.circular(16.0), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 150),
            const SizedBox(height: 16.0),
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text('Correct Answers: $correctCount'),
            Text('Incorrect Answers: $incorrectCount'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onRestartQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor:Provider.of<ThemeProvider>(context).isDarkMode ? Colors.black : Colors.greenAccent,
                foregroundColor: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(double.infinity, 48.0),
              ),
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
