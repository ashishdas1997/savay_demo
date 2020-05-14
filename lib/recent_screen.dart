import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 225,
        width: 190,
        child: Card(
          child: Wrap(
            children: [
              Column(
                children: <Widget>[
                  Image.asset(
                    'images/elephant.jpg',
                    width: 190,
                    height: 115,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Maharashtra to close shops, offic...',
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
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '13m ago',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.audiotrack,
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
