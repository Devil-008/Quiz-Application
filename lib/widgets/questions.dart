import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final List<Map<String, dynamic>> questionList = [
    {
      'Question': 'What is Flutter?',
      'answer': ['native', 'web', 'ios'],
      'correctAnswer': 'native'
    },
    {
      'Question': 'What is dart?',
      'answer': ['native', 'dart', 'ios'],
      'correctAnswer': 'dart'
    },
    {
      'Question': 'What is widget?',
      'answer': ['native', 'web', 'widget'],
      'correctAnswer': 'widget'
    },
    {
      'Question': 'What is continer?',
      'answer': ['continer', 'web', 'ios'],
      'correctAnswer': 'continer'
    },
    {
      'Question': 'What is sizedbox?',
      'answer': ['native', 'sizedbox', 'ios'],
      'correctAnswer': 'sizedbox'
    },
  ];

  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Question: What is Flutter?"),
              // SizedBox(
              //   height: 10,
              // ),
              ...questionList.map((e) => questionCard(
                      question: e['Question'],
                      childern: [
                        ...e['answer']
                            .map((e) => answerBtn(answer: e, onTap: () {}))
                      ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget questionCard(
      {required String question, required List<Widget> childern}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: childern,
        )
      ],
    );
  }

  Widget answerBtn({required String answer, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            answer,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
