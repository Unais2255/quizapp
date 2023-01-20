// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/controller/provider/provaiderDemo.dart';

import 'package:quizapp/view/homepage.dart';
import 'package:quizapp/view/splashscreen.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProviderDemo(),
    child: MaterialApp(
      home: Spalash(),
      debugShowCheckedModeBanner: false,
    ),
  )
  );
}
