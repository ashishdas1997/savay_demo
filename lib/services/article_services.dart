import 'package:flutter/material.dart';
import '../models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllServices with ChangeNotifier {
  List<Article> _items = [
//    Article(
//        type: 'Recent',
//        id: 'r1',
//        title: "Maharastra to close shops,offic...",
//        imageLink: "images/elephant.jpg",
//        addedTime: "13m  ago",
//        contentType: "Audio"
//        ),
//    Article(
//      type: 'Recent',
//      id: 'r2',
//      title: "Iran's coronavirus deaths rise to...",
//      imageLink: "images/covid.jpg",
//      addedTime: "49m ago",
//      contentType: "Video",
//    ),
//    Article(
//        type: 'Recent',
//        id: 'r3',
//        title: "Iot myth part 4 detailed",
//        imageLink: "images/iot.jpg",
//        addedTime: "3hr ago",
//        contentType: "Text"),
//    Article(
//        type: 'Technology',
//        id: 't1',
//        title: "Fruitful- Free WordPress...",
//        imageLink: "images/wordpress.jpg",
//        addedTime: "25m ago",
//        contentType: "Text"),
//    Article(
//        type: 'Technology',
//        id: 't2',
//        title: "White robot human features",
//        imageLink: "images/robo.jpg",
//        addedTime: "36m ago",
//        contentType: "Audio"),
//    Article(
//        type: 'Technology',
//        id: 't3',
//        title: "Iot myth part 4 detailed",
//        imageLink: "images/iot.jpg",
//        addedTime: "3hr ago",
//        contentType: "Audio"),
//    Article(
//        type: 'Movies',
//        id: 'm1',
//        title: "The Shawshank Redemption-Mov.. ",
//        imageLink: "images/shr.jpg",
//        addedTime: "5m ago",
//        contentType: "Video"),
//    Article(
//        type: 'Movies',
//        id: 'm2',
//        title: "Dangal-Official Trailer",
//        imageLink: "images/dangal.jpg",
//        addedTime: "26m ago",
//        contentType: "Video"),
//    Article(
//        type: 'Movies',
//        id: 'm3',
//        title: "Review- The Fault in Our Stars",
//        imageLink: "images/fault.jpg",
//        addedTime: "1hr ago",
//        contentType: "Text"),
  ];

  List<Article> get items {
    return [..._items];
  }

  Future<void> fetchArticles() async {
    const url = "https://savaydemonew.firebaseio.com/articles.json";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    final List<Article> loadedArticles = [];
    extractedData.forEach((artId, artData) {
      loadedArticles.add(Article(
        addedTime: artData['addedTime'],
        contentType: artData['contentType'],
        imageLink: artData['imageLink'],
        title: artData['title'],
        type: artData['type'],
        id: artId,
      ));
    });
    _items = loadedArticles;
    notifyListeners();
  }

  Future<void> addArticle(Article article) {
    const url = "https://savaydemonew.firebaseio.com/articles.json";
    return http
        .post(url,
            body: json.encode({
              'title': article.title,
              'type': article.type,
              "imageLink": article.imageLink,
              'addedTime': article.addedTime,
              "contentType": article.contentType,
              "isFavourite": article.isFavourite,
            }))
        .then((response) {
      final newArticle = Article(
          id: json.decode(response.body)['name'],
          type: article.type,
          title: article.title,
          imageLink: article.imageLink,
          addedTime: article.addedTime,
          contentType: article.contentType);
      _items.add(newArticle);
      notifyListeners();
    });
  }

  void deleteArticles(String id) {
    final url = "https://savaydemonew.firebaseio.com/articles/$id.json";
    final existingArticleIndex =
        _items.indexWhere((article) => article.id == id);
    var existingArticle = _items[existingArticleIndex];
    _items.removeAt(existingArticleIndex);
    http.delete(url).then((_) {
      existingArticle = null;
    });
    notifyListeners();
  }
}
