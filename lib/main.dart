import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/app_bloc.dart';
import 'package:news/bloc/app_states.dart';
import 'package:news/screens/welcome_page.dart';
import 'package:news/repositorie/news_repositorie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
