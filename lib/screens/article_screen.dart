import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article_services.dart';
import 'article_card.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Recent_Articles.map(
                    (artData) => ArticleCard(
                      artData.title,
                      artData.imageLink,
                      artData.addedTime,
                      artData.contentType,
                    ),
                  ).toList(),
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
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Technology_Articles.map((techData) => ArticleCard(
                        techData.title,
                        techData.imageLink,
                        techData.addedTime,
                        techData.contentType,
                      )).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10, left: 8),
                    child: Text(
                      ' Movies',
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
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Movie_Articles.map((movieData) => ArticleCard(
                        movieData.title,
                        movieData.imageLink,
                        movieData.addedTime,
                        movieData.contentType,
                      )).toList(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Theme.of(context).primaryColorLight,
          currentIndex: 2,
          showUnselectedLabels: true,
          unselectedLabelStyle:
              TextStyle(color: Theme.of(context).primaryColorLight),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
              ),
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
