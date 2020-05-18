import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleCard extends StatefulWidget {
  final String title;
  final String imageLink;
  final String addedTime;
  final String contentType;

  ArticleCard(this.title, this.imageLink, this.addedTime, this.contentType);

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 225,
      width: 195,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            child: Wrap(
              children: [
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.asset(
                          widget.imageLink,
                          width: 195,
                          height: 115,
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.white,
                            //margin: EdgeInsets.only( bottom: 5),
                            height: 30,
                            width: 58,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                      child: Icon(
                                        (isFavourite
                                            ? Icons.favorite
                                            : Icons.favorite_border),
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      onTap: () => toggleFavouriteStatus(),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.event_note,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                    //constraints: BoxConstraints.tight(Size(15, 25)),
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(49, 67, 89, 0.8),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.grey.shade400,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.addedTime,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      (widget.contentType == 'Audio')
                          ? Icon(
                              Icons.audiotrack,
                              size: 15,
                              color: Colors.grey.shade400,
                            )
                          : (widget.contentType == 'Video')
                              ? Icon(
                                  Icons.play_arrow,
                                  size: 15,
                                  color: Colors.grey.shade400,
                                )
                              : Icon(
                                  Icons.event_note,
                                  size: 15,
                                  color: Colors.grey.shade400,
                                ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.contentType,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void toggleFavouriteStatus() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }
}
