import 'package:flutter/material.dart';
import 'recent_screen.dart';

class Details extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: Text('Library',
          style: TextStyle(
              fontSize: 23,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold
          ),
          ),
          bottom: TabBar(
           labelColor: Theme.of(context).primaryColorLight,
            tabs: <Widget>[
              Tab(
                text: 'Aisles',
              ),
              Tab(
                text: 'Categories',
              ),
              Tab(
                text: 'Favourites',
              ),
            ],
          ),
        ),

            body : Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      RecentScreen(
                          "Maharastra to close shops,offic...",
                          'images/elephant.jpg'),
                      RecentScreen( "Iran's coronavirus deaths rise to...",
                          'images/covid.jpg'),
                      RecentScreen(
                          "IOT myth part 4 detailed...",
                          'images/iot.jpg'),
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
                      RecentScreen( "IOT myth part 4 detailed...",
                      'images/iot.jpg')
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

  }
}
