import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/widgets/questions.dart';

import 'list.dart';
import 'quiz.dart';

class QuizOption extends StatefulWidget {
  const QuizOption({super.key});

  @override
  State<QuizOption> createState() => _QuizOptionState();
}

class _QuizOptionState extends State<QuizOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz Option",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Wrap(children: [
          ...quizlist.map((e) => quizOption(
              title: e["title"], image: e["image"], context: context)),
        ]));
  }
}

Widget quizOption(
    {required title, required image, required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () {
          // Get.to(()=>QuizScreen());
          Get.to(() => Questions());
        },
        child: Container(
          height: 135,
          width: MediaQuery.of(context).size.width * .98,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                child: CircleAvatar(
                  child: Image.asset(image),
                  radius: 45,
                ),
              ),
              SizedBox(
                width: 30,
                
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
