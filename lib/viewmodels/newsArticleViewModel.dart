////this app not using VM, this is just to show the difference with and without VM
//import 'package:newsapp/model/news_article.dart';
//
//class NewsArticleViewModel {
//  // //at beginning we write this but as soon as we say this._ it will be an error
////  NewsArticle _newsArticle;
////  NewsArticleViewModel({this._newsArticle})
//
//  //this is to say we make _newsArticle as private but can be accessed from public via article
//  // ignore: sort_constructors_first
//  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;
//  //NewsArticle is the class we created
//  final NewsArticle _newsArticle;
//
//  String get title {
//    return _newsArticle.title;
//  }
//
//  String get description {
//    return _newsArticle.description;
//  }
//
//  String get imageURL {
//    return _newsArticle.urlToImage;
//  }
//
//  String get url {
//    return _newsArticle.url;
//  }
//}
