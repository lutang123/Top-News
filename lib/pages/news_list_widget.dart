import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/news_list_notifier.dart';
import 'news_detail_page.dart';
import 'news_tile_widget.dart';

class NewsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<NewsListNotifier>(
        builder: (context, newsList, child) => ListView.builder(
          itemCount: newsList.newsList.length,
          itemBuilder: (context, index) {
            final news = newsList.newsList[index];
            return NewsTileWidget(
              newsImageURL: news.urlToImage,
              newsTitle: news.title,
              onTapCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return NewsDetailsPage(article: news);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
