import 'package:flutter/material.dart';
import 'package:news_app/ApiServices/ApiServices.dart';
import 'package:news_app/NewsApp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Services>.value(
      value: Services(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsApp(),
      ),
    );
  }
}


