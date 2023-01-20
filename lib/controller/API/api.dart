import 'dart:convert';

import 'package:quizapp/model/model.dart';
import 'package:quizapp/view/homepage.dart';
import 'package:http/http.dart' as http;

Future<List<QuestionList>> getData() async {
  final response = await http
      .get(Uri.parse('https://637dbfffcfdbfd9a639bba1e.mockapi.io/sample'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in data) {
      quizList.add(QuestionList.fromJson(index));
    }
  }
  return quizList;
}
