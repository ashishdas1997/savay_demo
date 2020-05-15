import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatelessWidget {
  final String title;
  final String imageLink;
  RecentScreen(this.title, this.imageLink);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 225,
        width: 180,
        child: Card(
          child: Wrap(
            children: [
              Column(
                children: <Widget>[
                  Image.asset(
                    imageLink,
                    width: 180,
                    height: 115,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(49, 67, 89, 0.8)),
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
                          size: 15 ,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '13m ago',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.audiotrack,
                          size: 15,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Audio',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
