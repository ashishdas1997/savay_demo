import 'package:flutter/material.dart';
import '../screens/article_card.dart';

class ArticleRow extends StatelessWidget {
  final List rowArticles;
  ArticleRow(this.rowArticles);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 22, bottom: 10, left: 8),
              child: Text(
                rowArticles.first.type,
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
              children: rowArticles
                  .map(
                    (articleData) => ArticleCard(aisleData: articleData),
                  )
                  .toList(),
            )),
      ],
    );
  }
}
