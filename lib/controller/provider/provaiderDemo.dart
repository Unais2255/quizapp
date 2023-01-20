// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: unused_element, file_names

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/controller/list/list.dart';
// import 'package:quizapp/controller/list/list.dart';

import 'package:quizapp/view/homepage.dart';

class ProviderDemo with ChangeNotifier {
  bool firstbotton = false;
  bool secondbotton = false;
  bool thirdbotton = false;
  bool forthbotton = false;

  int questionindex = 0;
  int qustnnumber = 1;
  int bottonindex = 0;
  int score = 0;
  int selectoption = 0;

  

  void firstbuttoncolor() {
    firstbotton = true;
    secondbotton = false;
    thirdbotton = false;
    forthbotton = false;
    bottonindex = 0;
    selectoption = 0;
    notifyListeners();
  }

  void secondbuttoncolor() {
    firstbotton = false;
    secondbotton = true;
    thirdbotton = false;
    forthbotton = false;
    bottonindex = 1;
    selectoption = 1;
    notifyListeners();
  }

  void thirdbuttoncolor() {
    firstbotton = false;
    secondbotton = false;
    thirdbotton = true;
    forthbotton = false;
    bottonindex = 2;
    selectoption = 2;
    notifyListeners();
  }

  void forthbottoncolor1() {
    firstbotton = false;
    secondbotton = false;
    thirdbotton = false;
    forthbotton = true;
    bottonindex = 3;
    selectoption = 3;

    notifyListeners();
  }

  void scoreadding() {
    if (bottonindex == currectanswer[questionindex]) {
      score++;
    }
    notifyListeners();
  }

  void bottonclearing() {
    firstbotton = false;
    secondbotton = false;
    thirdbotton = false;
    forthbotton = false;
    notifyListeners();
  }

  void qustionchange() {
    print(questionindex);
    if (questionindex != 3) {
      questionindex++;
    }
    notifyListeners();
  }

  void restart() {
    number++;
    notifyListeners();
  }

  void barnumber() {
    number = 1;
    questionindex = 0;
    score = 0;
    notifyListeners();
  }
}
List currectanswer = [
   0,
 1,
 2,
 3,
];
