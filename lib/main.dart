import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/theme_provider.dart';
import 'package:flutter_quiz/screens/quiz_screen.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basic Quiz',
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      home: QuizScreen(),
    );
  }
}
