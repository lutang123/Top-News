import 'package:flutter/material.dart';

class NewsTileWidget extends StatelessWidget {
  final String newsImageURL;
  final String newsTitle;

  final Function onTapCallback;

  NewsTileWidget({
    this.newsImageURL,
    this.newsTitle,
    this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 100,
        height: 100,
        child: newsImageURL == null
            ? Image.asset('images/news-placeholder.png')
            : Image.network(newsImageURL),
      ),
      title: Text(newsTitle),
//      onTap: onTapCallback,
      //the following also works, just different syntax:
      onTap: onTapCallback,
    );
  }
}
