import 'package:flutter/material.dart';
import '../models/article.dart';
import 'article_card.dart';
import '../services/article_services.dart';

class ArticleSection extends StatefulWidget {
  final Article cardData;
  ArticleSection({this.cardData});

  @override
  _ArticleSectionState createState() => _ArticleSectionState();
}

class _ArticleSectionState extends State<ArticleSection> {
  List<Article> recentArticles = null;
  List<Article> technologyArticles = null;
  List<Article> movieArticles = null;

  @override
  void initState() {
    super.initState();
    recentArticles = Services.where((i) => i.type == ('Recent')).toList();
    technologyArticles =
        Services.where((i) => i.type == ('Technology')).toList();
    movieArticles = Services.where((i) => i.type == ('Movies')).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 22, bottom: 10, left: 8),
              child: Text(
                widget.cardData.type,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(49, 67, 89, 0.8)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22, right: 30, bottom: 10),
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
                children: (widget.cardData.type == 'Recent')
                    ? recentArticles
                        .map(
                          (artData) => ArticleCard(artData: artData),
                        )
                        .toList()
                    : (widget.cardData.type == 'Technology')
                        ? technologyArticles
                            .map(
                              (techData) => ArticleCard(artData: techData),
                            )
                            .toList()
                        : movieArticles
                            .map(
                              (movieData) => ArticleCard(artData: movieData),
                            )
                            .toList()))
      ],
    );
  }
}
