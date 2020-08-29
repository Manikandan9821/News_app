import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ApiServices/ApiServices.dart';
import 'package:news_app/Newsweb.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {

  //error image
  String noimage = "https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/12/1450973046wordpress-errors.png";

  @override
  Widget build(BuildContext context) {

    //providers
    final services = Provider.of<Services>(context);
    services.getServices();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
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

            services.newsModel.articles != null ?
            ListView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: services.newsModel.articles.length == null ? 0 : services.newsModel.articles.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  elevation: 0.5,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Webview(
                              Url: services.newsModel.articles[i].url,
                              name: services.newsModel.articles[i].source.name,
                            ),
                          ));
                    },
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            //descriptions
                            Padding(
                              padding: const EdgeInsets.only(top:11.0,left: 10.0),
                              child: Container(
                                width: 200,
                                child:  Text(
                                  services.newsModel.articles[i].description != null ?
                                  services.newsModel.articles[i].description
                                      : "No Description",
                                  textAlign: TextAlign.left,
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.5),
                                ),
                              ),
                            ),

                            SizedBox(height: 5.0,),

                            //name
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,top: 4.0),
                              child: Text(services.newsModel.articles[i].source.name),
                            ),

                            //time
                            Padding(
                              padding: const EdgeInsets.only(left:8.0,top: 5.0,bottom: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.access_time,color: Colors.redAccent,size: 17.0,),

                                  SizedBox(width: 5.0,),

                                  Text(services.newsModel.articles[i].publishedAt.hour.toString()+" hours"),
                                ],
                              ),
                            ),

                          ],
                        ),
                        //image
                        Expanded(
                          child: Container(
                            width: 150.0,height: 150.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  services.newsModel.articles[i].urlToImage != null
                                      ? services.newsModel.articles[i].urlToImage
                                      : noimage,
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                );
              },
            ) : Center(child: CircularProgressIndicator(),),
          ],
        ),
      ),
    );
  }
}