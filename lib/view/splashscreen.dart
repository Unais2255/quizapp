import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/view/homepage.dart';

class Spalash extends StatefulWidget {
  const Spalash({super.key});
  
  @override
  State<Spalash> createState() => _SpalashState();
}

class _SpalashState extends State<Spalash> {
  
  

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
     
      backgroundColor: Colors.amber,
      body: Column(
        children: [
              Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_z35UZP.json'),
          ),        
        ],
      ),
            Center(                   
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 111, 122),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          ' START ....QUIZ ',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: ((context) => (const Homepage()))),
                      );
                    },
          ),
                  ),
                ),
              ), 
        ]
      )  
    );
  }
}