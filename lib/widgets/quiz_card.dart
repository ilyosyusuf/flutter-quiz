
import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class QuizCard extends StatelessWidget {
  final String question;
  final List<String> answers;
  final ValueChanged<int> onAnswerSelected;

  QuizCard(
      {required this.question,
      required this.answers,
      required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Column(
                children: List.generate(
                  answers.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode ? Colors.black : Colors.greenAccent,
                        foregroundColor: Colors.white,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(double.infinity, 48.0),
                      ),
                      onPressed: () => onAnswerSelected(index),
                      child: Text(answers[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}