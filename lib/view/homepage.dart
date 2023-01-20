// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:quizapp/controller/API/api.dart';

import 'package:quizapp/controller/provider/provaiderDemo.dart';
import 'package:quizapp/model/model.dart';
import 'package:quizapp/view/second_page.dart';

import 'package:quizapp/view/third_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

List<QuestionList> quizList = [];
int questionindex = 0;
int qustnnumber = 1;
int bottonindex = 0;
int score = 1;
int selectoption = 0;
int number = 1;
int indexquestion = 0;

class HomepageState extends State<Homepage> {
  bool firstbotton = false;
  bool secondbotton = false;
  bool thirdbotton = false;
  bool forthbotton = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Consumer<ProviderDemo>(builder: (context, ProviderData, child) {
      questionindex = ProviderData.questionindex;
      qustnnumber = ProviderData.qustnnumber;
      bottonindex = ProviderData.bottonindex;
      score = ProviderData.score;
      selectoption = ProviderData.selectoption;
      firstbotton = ProviderData.firstbotton;
      secondbotton = ProviderData.secondbotton;
      thirdbotton = ProviderData.thirdbotton;
      forthbotton = ProviderData.forthbotton;

      return FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    title: const Padding(
                      padding: EdgeInsets.only(left: 65),
                      child: Text(
                        "Quiz",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  body: Center(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 210, top: 10),
                        child: Chip(
                          label: Text("$number/4"),
                          backgroundColor: Colors.white,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            '${quizList[0].questions[ProviderData.questionindex].question}',
                            style: TextStyle(fontSize: 10),
                          )),
                      const Divider(
                        thickness: 2,
                        indent: 8,
                        endIndent: 8,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 39,
                          width: 39,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 190, 193, 190),
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                ),
                              ]),
                          child: const Center(
                              child: Text("?",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black))),
                        ),
                      ),
                      const Text(
                        "Choose an answer",
                        style:
                            TextStyle(color: Color.fromARGB(255, 77, 77, 77)),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                const Text("A"),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '${quizList[0].questions[ProviderData.questionindex].answers[0]}',
                                
                                ),
                              ],
                            ),
                            onPressed: () {
                              ProviderData.firstbuttoncolor();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => firstbotton
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                const Text("B"),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '${quizList[0].questions[ProviderData.questionindex].answers[1]}',
                                ),
                              ],
                            ),
                            onPressed: () {
                              ProviderData.secondbuttoncolor();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => secondbotton
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                const Text("C"),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '${quizList[0].questions[ProviderData.questionindex].answers[2]}',
                                ),
                              ],
                            ),
                            onPressed: () {
                              ProviderData.thirdbuttoncolor();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => thirdbotton
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                const Text("D"),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '${quizList[0].questions[ProviderData.questionindex].answers[3]}',
                                ),
                              ],
                            ),
                            onPressed: () {
                              ProviderData.forthbottoncolor1();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => forthbotton
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 225,top: 70),
                        child: SizedBox(
                          height: h * 0.3,
                          width: w * 0.9,
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Next',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    
                                    print(quizList[0].questions[0].question);
                                    ProviderData.bottonclearing();
                                    ProviderData.scoreadding();

                                    ProviderData.qustionchange();
                                    ProviderData.restart();
                                    addingmark();
                                    print(score);
                                  }),
                            ],
                            
                          ),
                        ),
                      )
                    ]),
                  ));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }

  void addingmark() {
    if (questionindex < 3) {
    } else {
      if (score > 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => second_page()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => third_page()));
      }
    }
  }
}
