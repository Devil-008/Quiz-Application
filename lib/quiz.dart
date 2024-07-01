import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';
import 'package:quizapp/quiz_option.dart';

class Quiz {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Quiz(
      {required this.question,
      required this.options,
      required this.correctAnswerIndex});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // home: QuizScreen(),
        );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<Quiz> quizzes = [
    Quiz(
      question: 'What is the capital of France?',
      options: ['Paris', 'London', 'Berlin'],
      correctAnswerIndex: 0,
    ),
    Quiz(
      question: 'What is the largest country in the world?',
      options: ['Russia', 'Canada', 'China'],
      correctAnswerIndex: 2,
    ),
    Quiz(
        question: 'What is the smallest continent in the world?',
        options: ['Asia', 'Africa', 'Australia'],
        correctAnswerIndex: 2),
    Quiz(question: '', options: [''], correctAnswerIndex: 2),
    // Add more quizzes here...
  ];

  late Timer _timer;
  int _remainingTime = 10; // Initial time in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          currentQuestionIndex = currentQuestionIndex + 1;
        }
      });
    });
  }

  voidcheckAnswer(int selectedOptionIndex) {
    if (selectedOptionIndex ==
        quizzes[currentQuestionIndex].correctAnswerIndex) {
      // Correct answer! Award points.
      // score += 10;
    } else {
      // Incorrect answer! Deduct points (if needed).
    }
    // Move to the next question
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % quizzes.length;
      _remainingTime = 10; // Reset timer for the next question
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuiz = quizzes[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
          // title: Text('Quiz App')
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuiz.question,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              'Time remaining: $_remainingTime seconds',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            ...currentQuiz.options.map((option) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Check if the selected option is correct
                      if (currentQuiz.correctAnswerIndex ==
                          currentQuiz.options.indexOf(option)) {
                        // Correct answer! Handle it here.
                      } else {
                        // Incorrect answer! Handle it here.
                      }
                      // Move to the next question
                      setState(() {
                        currentQuestionIndex =
                            (currentQuestionIndex + 1) % quizzes.length;
                        _remainingTime =
                            10; // Reset timer for the next question
                      });
                    },
                    child: Text(
                      option,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Text('Score': $score)
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
