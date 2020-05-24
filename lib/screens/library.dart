import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/article.dart';
import '../screens/library_screen.dart';
import '../services/article_services.dart';

class Library extends StatelessWidget {
  void addArticle(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_) {
        return Library();
      }
    ),);
  }
  @override
  Widget build(BuildContext context) {
    final articleData= Provider.of<AllServices>(context);
    return Scaffold(appBar: AppBar(
      title: const Text("All Articles"),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.add),
        onPressed: ()=> addArticle(context),
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(itemCount:articleData.items.length,
      itemBuilder: (_, i) => LibraryScreen(articleData.items[i].title,
      articleData.items[i].imageLink,
        articleData.items[i].contentType
      ),
      ),
    ),
    );
  }
}
