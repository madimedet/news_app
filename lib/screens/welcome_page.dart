import 'dart:async';

import 'package:news/screens/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(height: 300),
      Container(
        width: width * 0.6,
        height: width * 0.6,
        child: Image.asset(
          "assets/news.png",
          fit: BoxFit.contain,
        ),
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MedData()));
          },
          child: Text('Start', style: TextStyle(fontSize: 25)))
    ])));
  }
}
