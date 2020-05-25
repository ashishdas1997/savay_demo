import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Article with ChangeNotifier {
  final String type;
  final String id;
  final String title;
  final String imageLink;
  final String addedTime;
  final String contentType;
  bool isFavourite;

  Article(
      {@required this.type,
      @required this.id,
      @required this.title,
      @required this.imageLink,
      @required this.addedTime,
      @required this.contentType,
      @required this.isFavourite});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
  }
}
