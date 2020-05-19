import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/article_services.dart';
import '../models/article.dart';

class CategoryCard extends StatefulWidget {
  final Article artData;
  CategoryCard({this.artData});
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isFavourite = false;

  void toggleFavouriteStatus() {
    setState(() {
      print(isFavourite);
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 222,
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
                          widget.artData.imageLink,
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
                                      behavior: HitTestBehavior.translucent,
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
                    widget.artData.title,
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
                        widget.artData.addedTime,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      (widget.artData.contentType == 'Audio')
                          ? Icon(
                              Icons.audiotrack,
                              size: 15,
                              color: Colors.grey.shade400,
                            )
                          : (widget.artData.contentType == 'Video')
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
                        widget.artData.contentType,
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
}
