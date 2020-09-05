import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/ApiServices/ApiServices.dart';
import 'package:news_app/Models/listItem.dart';
import 'package:news_app/Newsweb.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {


  @override
  Widget build(BuildContext context) {

    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    //providers
    final services = Provider.of<Services>(context);
    services.getServices();

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.grey[300],
        elevation: 0.5,
        title: Text('News App',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      drawer: Drawer(),

      backgroundColor: Colors.grey[300],

      body: Column(

          children: <Widget>[

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Discover News',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),


            Expanded(
              child: services.newsModel.articles != null ?

              ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                 itemCount: services.newsModel.articles.length == null ? 0 : services.newsModel.articles.length,
                  itemBuilder: (context,index){
                    var formatTime = DateFormat('dd MMM - HH:mm').format(services.newsModel.articles[index].publishedAt);
                    return
                      ListItems(
                        description:services.newsModel.articles[index].description,
                        url: services.newsModel.articles[index].url,
                        name: services.newsModel.articles[index].source.name,
                        time : formatTime,
                        image: services.newsModel.articles[index].urlToImage,
                    );
                  },
              )

              : Center(child: CircularProgressIndicator(),),
            ),

          ],
        ),

    );
  }




}