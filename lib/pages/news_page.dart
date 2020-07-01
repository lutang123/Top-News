import 'package:flutter/material.dart';
import 'package:newsapp/news_list_notifier.dart';
import 'news_list_widget.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

//class LoadingScreen extends StatefulWidget {
//  @override
//  _LoadingScreenState createState() => _LoadingScreenState();
//}
//
//class _LoadingScreenState extends State<LoadingScreen> {
//  @override
//  void initState() {
//    super.initState();
//    showTopHeadlines();
//  }
//
//  void showTopHeadlines() async {
//    //this function returns Future<List<NewsArticle>>
//    var newsList = await Webservice().fetchTopHeadlines();
//
//    await Navigator.push(context,
//        MaterialPageRoute(builder: (context) => NewsPage(newsList: newsList)));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: SpinKitDoubleBounce(
//          color: Colors.white,
//          size: 100,
//        ),
//      ),
//    );
//  }
//}

class NewsPage extends StatefulWidget {
//  NewsPage({this.newsList});
//  final newsList;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _controller = TextEditingController();

//  List<NewsArticle> newsListPage = []; //with provider, no need to have this.

  @override
  void initState() {
    super.initState();
//    showTopHeadlines();       //with provider, no need to have this.
    Provider.of<NewsListNotifier>(context, listen: false)
        .showHeadlines(); //this returns newsList
  }

  // //with provider, no need to have this.
//  void showTopHeadlines() async {
//    //this function returns Future<List<NewsArticle>>
//    newsListPage = await Webservice().fetchTopHeadlines();
//    updateUI(newsListPage);
//  }

//  void updateUI(var newsList) {
//    setState(() {
//      newsListPage = newsList;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    //instead of this, we can also use Consumer
    final newsList = Provider.of<NewsListNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                await newsList.search(value);
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter search term',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () async {
                  _controller.clear();
                  await newsList.showHeadlines();
                  //add this to make keyboard disappear
                  FocusScope.of(context).unfocus();
//                    var newsList = await Webservice().fetchTopHeadlines();
//                    updateUI(newsList);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${newsList.newsList.length} news found'),
          ),
          //must wrap into Expanded otherwise not show anything but not error either
          newsList.newsList.isEmpty
              ? Text('No resulte found')
              : NewsListWidget(),
        ],
      ),
    );
  }
}
