import 'package:flutter/material.dart';
import 'recent_screen.dart';

class Details extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        right: true,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Library',
                  style: TextStyle(
                      fontSize: 23,
                      color: Color.fromRGBO(49, 67, 89, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Aisles',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 177, 255, 0.8),
                            fontSize: 16),
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                      Text(
                        'Favourites',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade300, height: 5, thickness: 1.5),
              Container(
                padding: EdgeInsets.symmetric(vertical: 17),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      ' Recent',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(49, 67, 89, 0.8)),
                    ),
                    Text(
                      ' See all',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 177, 255, 0.8)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    RecentScreen(
                        "Maharastra to close shops, offic...",
                        'images/elephant.jpg'),
                    RecentScreen( "Iran's coronavirus deaths rise to...",
                        'images/covid.jpg'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      ' Technology',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(49, 67, 89, 0.8)),
                    ),
                    Text(
                      ' See all',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 177, 255, 0.8)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    RecentScreen( "Fruitful- Free WordPress...",
                        'images/wordpress.jpg'),
                    RecentScreen( "White robot human features",
                        'images/robo.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
