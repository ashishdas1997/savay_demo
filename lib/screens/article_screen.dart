import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savaydemo/screens/library.dart';
import 'package:savaydemo/screens/library_screen.dart';
import '../screens/article_row.dart';
import '../services/article_services.dart';
import '../screens/category_row.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override

  void addArticle(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(Library.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final artData= Provider.of<AllServices>(context);
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
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ArticleRow(artData.items.where((allServicesData) =>
                            allServicesData.type == 'Recent').toList()),
                        ArticleRow(artData.items.where((allServicesData) =>
                            allServicesData.type == 'Technology').toList()),
                        ArticleRow(artData.items.where((allServicesData) =>
                            allServicesData.type == 'Movies').toList())
                      ],
                    )),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CategoryRow(artData.items.where((allServicesData) =>
                            allServicesData.contentType == 'Audio').toList()),
                        CategoryRow(artData.items.where((allServicesData) =>
                            allServicesData.contentType == 'Video').toList()),
                        CategoryRow(artData.items.where((allServicesData) =>
                            allServicesData.contentType == 'Text').toList())
                      ],
                    )),
                Container(
                    child: Center(
                        child: Text(' You hav not added any Favourites yet!')))
              ],
            ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () => addArticle(context),
              label: Text('Library')),
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
      icon: Icon(Icons.account_circle,
      ),
      title: Text('Account'),
    ),
  ],


),
          ),


    );
  }
}
