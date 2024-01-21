import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/theme_provider.dart';
import 'package:flutter_quiz/widgets/quiz_card.dart';
import 'package:flutter_quiz/widgets/quiz_result.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _correctCount = 0;
  int _incorrectCount = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which programming language is used in Flutter?',
      'answers': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'correctIndex': 2,
    },
    {
      'question': 'What does the term "Hot Reload" mean in Flutter?',
      'answers': [
        'Heating up the device',
        'Reloading the app without restarting it',
        'Refreshing the code editor',
        'Adjusting the device temperature'
      ],
      'correctIndex': 1,
    },
    {
      'question': 'Which widget is used for drawing custom shapes in Flutter?',
      'answers': ['Container', 'Painter', 'CustomPaint', 'ShapeWidget'],
      'correctIndex': 2,
    },
    {
      'question':
          'What is the purpose of the "pubspec.yaml" file in a Flutter project?',
      'answers': [
        'Defining project dependencies',
        'Storing app assets',
        'Setting up API keys',
        'Configuring build settings'
      ],
      'correctIndex': 0,
    },
    {
      'question': "'What is Flutter' default design language?",
      'answers': [
        'Material Design',
        'Cupertino Design',
        'Flat Design',
        'Neumorphism'
      ],
      'correctIndex': 0,
    },
    {
      'question': 'Which class is the base for all widgets in Flutter?',
      'answers': ['App', 'WidgetBase', 'Object', 'StatelessWidget'],
      'correctIndex': 2,
    },
    {
      'question':
          'What is the purpose of the "async" and "await" keywords in Dart?',
      'answers': [
        'Defining asynchronous functions',
        'Handling exceptions',
        'Declaring constants',
        'Loop control'
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the purpose of a Flutter GlobalKey?',
      'answers': [
        'To uniquely identify widgets in the widget tree',
        'To manage the state of stateful widgets',
        'To declare global variables',
        'To handle asynchronous operations',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the purpose of the "const" keyword in Dart?',
      'answers': [
        'To declare constant variables',
        'To create immutable objects',
        'To define compile-time constants',
        'To prevent memory leaks',
      ],
      'correctIndex': 2,
    },
    {
      'question': 'How does Flutter handle state management?',
      'answers': [
        'Using global variables',
        'Using the "state" keyword',
        'Using the provider package',
        'Using the setState() method',
      ],
      'correctIndex': 2,
    },
    {
      'question': 'What is the purpose of the "super" keyword in Dart?',
      'answers': [
        'To call the superclass constructor or method',
        'To declare a superclass',
        'To access static members of the superclass',
        'To invoke the superclass destructor',
      ],
      'correctIndex': 0,
    },
    {
      'question':
          'Which Flutter widget is used for navigation between screens?',
      'answers': [
        'Navigator',
        'RouteManager',
        'ScreenSwitcher',
        'PageController',
      ],
      'correctIndex': 0,
    },
    {
      'question':
          'What is the difference between StatelessWidget and StatefulWidget?',
      'answers': [
        'StatelessWidgets cannot have any internal state, whereas StatefulWidgets can.',
        'StatelessWidgets are deprecated in Flutter 2.0.',
        'StatefulWidgets can only be used in web applications.',
        'StatelessWidgets are automatically updated by Flutter.',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the purpose of the "async*" keyword in Dart?',
      'answers': [
        'To declare asynchronous functions',
        'To create asynchronous generators',
        'To handle exceptions in asynchronous code',
        'To define asynchronous variables',
      ],
      'correctIndex': 1,
    },
    {
      'question': 'What is an InheritedWidget in Flutter?',
      'answers': [
        'A widget that inherits from another widget',
        'A widget that can be reused in multiple screens',
        'A widget that provides data to its descendants',
        'A widget that controls the layout of its children',
      ],
      'correctIndex': 2,
    },
    {
      'question': 'How can you perform background tasks in Flutter?',
      'answers': [
        'Using the main isolate',
        'Using the background isolate',
        'Flutter does not support background tasks',
        'Using the compute function',
      ],
      'correctIndex': 3,
    },
    {
      'question':
          'What is the purpose of the "didUpdateWidget" method in a StatefulWidget?',
      'answers': [
        'To update the widget tree during hot reload',
        'To compare the old and new widget configurations',
        'To notify the widget that it should rebuild',
        'To initialize the widget after it is updated',
      ],
      'correctIndex': 1,
    },
    {
      'question': 'What is the Flutter BLoC pattern?',
      'answers': [
        'Business Logic on Components',
        'Base Layer of Components',
        'Behavioral Logic of Components',
        'Business Logic Component',
      ],
      'correctIndex': 3,
    },
    {
      'question':
          'Which package is commonly used for state management in Flutter?',
      'answers': [
        'Provider',
        'Stateful',
        'StateKeeper',
        'StateManager',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the purpose of the "const" constructor in Dart?',
      'answers': [
        'To create constant instances of a class',
        'To declare a class as constant',
        'To prevent inheritance of a class',
        'To define constant methods',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'How can you add padding to a widget in Flutter?',
      'answers': [
        'Using the Padding widget',
        'By setting the padding property',
        'Using the Spacer widget',
        'Padding is added automatically',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the purpose of the "Visibility" widget in Flutter?',
      'answers': [
        'To control the visibility of a widget',
        'To hide widgets from the widget tree',
        'To make widgets transparent',
        'To change the z-index of widgets',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'How does Flutter handle dependency injection?',
      'answers': [
        'Using the provider package',
        'By manually injecting dependencies',
        'Flutter does not support dependency injection',
        'Using the GetIt package',
      ],
      'correctIndex': 0,
    },
    {
      'question': 'What is the purpose of the "MediaQuery" widget in Flutter?',
      'answers': [
        'To detect changes in the media query',
        'To retrieve information about the device',
        'To change the media settings of the app',
        'To handle media-related events',
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'Which method is called when a StatefulWidget is first inserted into the tree?',
      'answers': [
        'initState',
        'didInsertWidget',
        'onBuild',
        'onInsert',
      ],
      'correctIndex': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _questions.shuffle(); // Shuffle questions when the quiz starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Basic Quiz'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              icon: Provider.of<ThemeProvider>(context).isDarkMode
                  ? const Icon(CupertinoIcons.sun_max)
                  : const Icon(
                      CupertinoIcons.moon_fill,
                    )),
        ],
      ),
      body: _currentIndex < _questions.length
          ? QuizCard(
              question: _questions[_currentIndex]['question'],
              answers: _questions[_currentIndex]['answers'],
              onAnswerSelected: _handleAnswerSelected,
            )
          : QuizResult(
              correctCount: _correctCount,
              incorrectCount: _incorrectCount,
              onRestartQuiz: _restartQuiz,
            ),
    );
  }

  void _handleAnswerSelected(int selectedIndex) {
    int correctIndex = _questions[_currentIndex]['correctIndex'];
    bool isCorrect = selectedIndex == correctIndex;

    String message = isCorrect
        ? '🥳 Correct! '
        : '🤦🏻‍♂️ Incorrect! Correct answer: ${_questions[_currentIndex]['answers'][correctIndex]}';
    Color color = isCorrect ? Colors.green : Colors.red;

    _showSnackbar(message, color);

    if (isCorrect) {
      // Handle correct answer logic (e.g., score increment)
      setState(() {
        _correctCount++;
      });
    } else {
      // Handle incorrect answer logic
      setState(() {
        _incorrectCount++;
      });
    }

    setState(() {
      _currentIndex++;

      if (_currentIndex < _questions.length) {
        _questions.shuffle(); // Shuffle questions for the next round
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentIndex = 0;
      _correctCount = 0;
      _incorrectCount = 0;
      _questions.shuffle(); // Shuffle questions when the quiz restarts
    });
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }
}
