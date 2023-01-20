import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/controller/provider/provaiderDemo.dart';

import 'package:quizapp/view/homepage.dart';

class third_page extends StatelessWidget {
  third_page({super.key});
  int score = 0;

  @override
  Widget build(BuildContext context) {
    score = context.read<ProviderDemo>().score;
    return Consumer<ProviderDemo>(builder: (context, providerdata, child) {
      {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: (() {
                  questionindex = 0;
                  providerdata.scoreadding();
                }),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Text(
                "Result",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
          ),
          body: Stack(
            children: [
              Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_obhph3sh.json'),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: new CircularPercentIndicator(
                        progressColor: Colors.orange,
                        radius: 70.0,
                        lineWidth: 15.0,
                        animation: true,
                        percent: score / 4,
                        center: new Text(
                          "$score/4",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: SizedBox(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: Row(
                            children: [
                              Text(
                                'Ooops....!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => third_page()),
                            );
                          },
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          qustnnumber = 0;
                          bottonindex = 0;
                          selectoption = 0;
                          questionindex = 0;
                          score = 0;
                          providerdata.barnumber();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()),
                          );
                        },
                        child: Text("Try Again"))
                   
                  ],
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
