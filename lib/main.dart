import 'package:flutter/material.dart';
import 'package:newsapp/pages/news_page.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/news_list_notifier.dart';

//1. how to add spinner more efficiently while loading?
//2. how to make web view no black page?

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NewsListNotifier(),
        child: NewsPage(),
      ),
    );
  }
}
