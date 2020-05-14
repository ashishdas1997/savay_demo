import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savaydemo/detail.dart';
import 'recent_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Savay',
      theme: ThemeData(
          fontFamily: 'sen',
          primaryColor: Color.fromRGBO(248, 248, 248, 1),),
      home: Filters(),
    );
  }
}

class Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Details();
  }
}
