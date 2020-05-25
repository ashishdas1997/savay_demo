import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savaydemo/screens/edit_article_screen.dart';
import '../models/article.dart';
import '../screens/library_screen.dart';
import '../services/article_services.dart';

class Library extends StatelessWidget {
  static const routeName = '/library';
  @override
  Widget build(BuildContext context) {
    final articleData = Provider.of<AllServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Articles"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: "Add New Article",
            onPressed: () {
              Navigator.of(context).pushNamed(EditArticleScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: articleData.items.length,
          itemBuilder: (_, i) => LibraryScreen(
              articleData.items[i].title,
              articleData.items[i].imageLink,
              articleData.items[i].contentType,
              articleData.items[i].addedTime,
              articleData.items[i].id),
        ),
      ),
    );
  }
}
