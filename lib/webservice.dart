//Step 2:
import 'dart:convert';
import 'package:newsapp/model/news_article.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<NewsArticle>> fetchHeadlines() async {
    final response = await http.get(Constants.TOP_HEADLINES_URL);
    return parseJson(response);
  }

  Future<List<NewsArticle>> fetchByKeywords(String keyword) async {
    final response = await http.get(Constants.headlinesFor(keyword));
    return parseJson(response);
  }

  //this function parson json and return a list of NewsArticle
  List<NewsArticle> parseJson(http.Response response) {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      //result is a json, we want the key for articles
      //result["articles"] is list of dictionary for each article
      Iterable list = result['articles'];
      //each article is a dictionary
      return list
          .map(
            //this is the function we created, we map through each
            //article and the converted to NewsArticle object, and put them in a list
            (article) => NewsArticle.fromJSON(article),
          )
          .toList();
    } else {
      throw Exception('Failed to get top news');
    }
  }
}
