import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:news_app/Models/NewsModel.dart';

class Services extends ChangeNotifier
{
     NewsModel _newsModel = NewsModel();

     NewsModel get newsModel => _newsModel;

    set newsModel(NewsModel value) {
    _newsModel = value;
    notifyListeners();
  }


 
  Future<NewsModel> getServices() async
     {

       //news api
       String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=879fe6d77dd742afa671e61f3c2c8506";

       // response
       final http.Response response = await http.get(url);

       //checking the response
       if(response.statusCode == 200)
       {
         final news = newsModelFromJson(response.body);
         newsModel = news;
         return newsModel;
       }
       else
       {
         throw Exception('Error');
       }

     }



}