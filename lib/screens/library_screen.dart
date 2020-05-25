import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/article_services.dart';

class LibraryScreen extends StatelessWidget {
  final String title;
  final String imageLink;
  final String contentType;
  final String addedTime;
  LibraryScreen(this.title,this.imageLink, this.contentType, this.addedTime);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(
      title
    ),
    subtitle:Text(contentType) ,
    leading: CircleAvatar(backgroundImage: AssetImage(imageLink),

    ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: (){
          Provider.of<AllServices>(context, listen: false).deleteArticles(title);
        },
      )
    );
  }
}
