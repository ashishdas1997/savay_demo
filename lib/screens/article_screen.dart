import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';
import '../screens/article_section.dart';
import '../services/article_services.dart';
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
              children:[
                Services.map(
                  (cardData) => ArticleSection(cardData: cardData),
                ).firstWhere(
                        (a) => a.cardData.type == 'Recent'),
                Services.map(
                  (cardData) => ArticleSection(cardData: cardData),
                ).firstWhere(
                    (Article) => Article.cardData.type == ('Technology')),
                Services.map(
                  (cardData) => ArticleSection(cardData: cardData),
                ).firstWhere((Article) => Article.cardData.type == ('Movies')),
              ],
            )),
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
