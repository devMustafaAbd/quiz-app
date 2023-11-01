import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers.clear();
    });
  }

  void homeScreen() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? correntScreen;
    // if (activeScreen == 'start-screen') {
    //   correntScreen = StartScreen(switchScreen);
    // } else if (activeScreen == 'questions-screen') {
    //   correntScreen = QuestionsScreen(chooseAnswer);
    // } else if (activeScreen == 'result-screen') {
    //   correntScreen = ResultScreen(switchScreen);
    // }
    switch (activeScreen) {
      case 'start-screen':
        correntScreen = StartScreen(switchScreen);
        break;
      case 'questions-screen':
        correntScreen = QuestionsScreen(chooseAnswer);
        break;
      case 'result-screen':
        correntScreen = ResultScreen(selectedAnswers, restartQuiz, homeScreen);
        break;
      default:
        correntScreen = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 109, 13, 219),
          title: const Center(
            child: Text('Quiz App'),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: correntScreen,
        ),
      ),
    );
  }
}
