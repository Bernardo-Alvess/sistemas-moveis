// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:aula_revisao/pages/first_page.dart';
import 'package:aula_revisao/pages/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List names = ['Bernardo', 'Julia', 'Fabio', 'Lorenzo', 'Slatt'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: FirstPage(),
      routes: {
        '/secondpage': (context) => SecondPage(),
      },
    );
  }
}
