import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/Home.dart';

void main() {
  runApp(CounterApp());
}

 class CounterApp extends StatelessWidget{
    CounterApp();

    Widget build(BuildContext context){
      return MaterialApp(
        title: 'Counter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red
        ),
        home: Home(),
      );
    }
 }

