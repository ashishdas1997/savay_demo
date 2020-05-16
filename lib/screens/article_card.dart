import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageLink;
  final String addedTime;
  final String contentType;
  ArticleCard(this.title, this.imageLink, this.addedTime, this.contentType);

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
                        imageLink,
                        width: 195,
                        height: 115,
                        fit: BoxFit.fitWidth,
                      ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        margin: EdgeInsets.only(right: 5, bottom: 5),
                        height: 25,
                        width: 58,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                            Icons.favorite,
                          color: Colors.grey,
                              size: 15,
                          ),
                            VerticalDivider(),
                            Icon(
                              Icons.event_note,
                              color: Colors.grey,
                              size: 15,
                            )
                        ],),
                      ),
                    ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        title,
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
                            addedTime,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                           (contentType== 'Audio')?Icon(
                            Icons.audiotrack,
                            size: 15,
                            color: Colors.grey.shade400,
                          )
                          : (contentType=='Video')? Icon(
                            Icons.play_arrow,
                            size: 15,
                            color: Colors.grey.shade400,
                          )
                          :Icon(
                    Icons.event_note,
                    size: 15,
                      color: Colors.grey.shade400,
                    ),
                          SizedBox(
                            width:5 ,
                          ),
                          Text(
                            contentType,
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          )
                        ],
                      ),
                    ), ],

                ),
                ],)
            ),
          ),
    );
  }
}
