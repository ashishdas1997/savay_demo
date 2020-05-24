import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savaydemo/models/my_colors.dart';
import 'package:savaydemo/services/article_services.dart';
import 'screens/article_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AllServices(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Savay',
        theme: ThemeData(
            fontFamily: 'sen',
            primaryColor: MyColor.primaryColor,
            primaryColorDark: MyColor.primaryDarkColor,
            primaryColorLight: MyColor.primaryLightColor,
            accentColor: MyColor.primaryAssentColor),
        home: ArticleScreen(),
      ),
    );
  }
}
