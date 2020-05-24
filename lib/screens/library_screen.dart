import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final String title;
  final String imageLink;
  final String contentType;
  LibraryScreen(this.title,this.imageLink, this.contentType);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(
      title
    ),
    subtitle:Text(contentType) ,
    leading: CircleAvatar(backgroundImage: AssetImage(imageLink),

    ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.edit),
            onPressed: (){},
              color: Theme.of(context).primaryColor,
            ),
            IconButton(icon: Icon(Icons.delete),
            onPressed:(){},
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
