import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list.dart';
import 'quiz_option.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: RichText(
            textAlign: TextAlign.start,
            text: const TextSpan(
                text: "Home",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n hello, Himanshu',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ]),
          ),
        ),
        body: Container(
        
          decoration:  BoxDecoration(
            color: Colors.green[300],
            borderRadius:  BorderRadius.only(topLeft: Radius.circular(25),topRight: const Radius.circular(25))
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Menu",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const QuizOption());
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
                          offset: const Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            child: Image.asset('assets/images/quiz.png'),
                            radius: 45,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          'Start Quiz',
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
            ),
            const SizedBox(
              height: 7,
            ),
            Wrap(children: [
              ...itemlist.map((e) => itemlistCard(
                  context: context, title: e["title"], image: e["image"]))
            ]),
          ]),
        ));
  }
}

Widget itemlistCard(
    {required image, required title, required BuildContext context}) {
  return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 14 / 100,
              width: MediaQuery.of(context).size.width * 35 / 100,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Text(title,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))
          ]));
}
