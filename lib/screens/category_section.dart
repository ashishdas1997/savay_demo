import 'package:flutter/material.dart';
import '../models/article.dart';
import 'article_card.dart';
import '../services/article_services.dart';
import '../screens/category_card.dart';

class CategorySection extends StatefulWidget {
  final Article cardData;
  CategorySection({this.cardData});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {

  List<Article> video = [];
  List<Article> audio = [];
  List<Article> text = [];


  @override
  void initState(){
    super.initState();
    video = Services.where((i) => i.contentType ==('Video')).toList();
    audio = Services.where((i) => i.contentType ==('Audio')).toList();
    text = Services.where((i) => i.contentType ==('Text')).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 22, bottom: 10, left: 8),
            child: Text(
              widget.cardData.contentType,
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
          child:Row(
              children:
              (widget.cardData.contentType=='Video')? video.map(
                    (artData) => CategoryCard(artData: artData),
              ).toList()
                  : (widget.cardData.contentType=='Audio')?audio.map(
                    (techData) => CategoryCard(artData: techData),
              ).toList()
                  :text.map(
                    (movieData) => CategoryCard(artData: movieData),
              ).toList())
      )
    ],
    );
  }
}
