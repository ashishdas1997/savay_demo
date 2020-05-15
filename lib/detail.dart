import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'recent_screen.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(248, 248, 248, 1),
          title: Text(
            'Library',
            style: TextStyle(
              fontSize: 23,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelColor: Theme.of(context).accentColor,
                  isScrollable: true,
                  indicatorColor: Theme.of(context).accentColor,
                  unselectedLabelColor: Theme.of(context).primaryColorLight,
                  labelStyle: TextStyle(
                    fontFamily: 'sen',
                    fontSize: 16,
                  ),
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
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 8),
                  child: Text(
                    ' Recent',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(49, 67, 89, 0.8)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    ' See all',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color:
                    Theme.of(context).accentColor
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  RecentScreen("Maharastra to close shops,offic...",
                      'images/elephant.jpg'),
                  RecentScreen("Iran's coronavirus deaths rise to...",
                      'images/covid.jpg'),
                  RecentScreen("IOT myth part 4 detailed...", 'images/iot.jpg'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 8),
                    child: Text(
                      ' Technology',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(49, 67, 89, 0.8)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Text(
                      ' See all',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color:Theme.of(context).accentColor
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  RecentScreen(
                      "Fruitful- Free WordPress...", 'images/wordpress.jpg'),
                  RecentScreen("White robot human features", 'images/robo.jpg'),
                  RecentScreen("IOT myth part 4 detailed...", 'images/iot.jpg')
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Theme.of(context).primaryColorLight,
          currentIndex: 2,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).primaryColorLight
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home',),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.border_outer),
              title: Text('Library'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              title: Text('Notes'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
          ],
        ),
    ),
      );
  }
}
