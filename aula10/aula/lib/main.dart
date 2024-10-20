import 'dart:math';

import 'package:flutter/material.dart';

List<String> names = [
  "bernardo",
  "maik",
  "lorenzo",
  "bica",
  "fabio",
  "junges"
];

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Novo App"), backgroundColor: Colors.primaries[Random().nextInt(10)],),
        body: MyList(data: names)
      ),
    );
  }
}


class MyList extends StatelessWidget {
  final List<String> data;
  const MyList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(title: Text(data[index]), leading: Icon(Icons.people));
          }, 
          separatorBuilder: (_,__) {
            return const Divider();
          }, 
          itemCount: data.length
        );
  }
}