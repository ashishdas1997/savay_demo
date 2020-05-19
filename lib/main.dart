import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savaydemo/models/my_colors.dart';
import 'screens/article_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Savay',
      theme: ThemeData(
          fontFamily: 'sen',
          primaryColor: MyColor.PrimaryColor,
          primaryColorDark: MyColor.PrimaryDarkColor,
          primaryColorLight: MyColor.PrimaryLightColor,
          accentColor: MyColor.PrimaryAssentColor),
      home: Filters(),
    );
  }
}

class Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ArticleScreen();
  }
}
