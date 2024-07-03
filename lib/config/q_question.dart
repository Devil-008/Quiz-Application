// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class QuizApp extends StatelessWidget {
//   // final QuizController quizController = Get.put(QuizController());

//   @override
//   Widget build(BuildContext context) {
//     // final currentQuestion =
//     //     quizController.questions[quizController.currentIndex.value];

//     return Scaffold(
//       appBar: AppBar(title: Text('Quiz App')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(currentQuestion.question),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 print('Answer: ${currentQuestion.answer}');
//               },
//               child: Text('Show Answer'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: quizController.nextQuestion,
//               child: Text('Next Question'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
