import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Newsweb.dart';

class ListItems extends StatefulWidget {

  final String description;
  final String url;
  final String name;
  final  time;
  final String image;

   ListItems({Key key, this.description, this.url, this.name, this.time, this.image});

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {

  @override
  Widget build(BuildContext context) {

    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    //error image
    String noimage = "https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/12/1450973046wordpress-errors.png";

    var desc = widget.description;
    var image = widget.image;
    var url = widget.url;
    var time = widget.time;
    var name = widget.name;

    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Webview(
                Url: url,
                name: name,
              ),
            ));
      },
      child: Stack(
          children: <Widget>[

             Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: 150.0,
                  width:  325,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[


                      //descriptions
                      Padding(
                        padding: const EdgeInsets.only(top:10.0,left: 10.0),
                        child: Container(
                          width: 250,
                          child:
                          Text(
                            '${ desc != null ? widget.description : "No Description  preview Here!"}',
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15.5),
                          ),
                        ),
                      ),

                      //name
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 4.0),
                        child: Text('${name != null ? name : "Name Not Mentioned Here!"}'),
                      ),

                      //time
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 5.0,bottom: 3.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.access_time,color: Colors.redAccent,size: 17.0,),

                            SizedBox(width: 5.0,),

                            Text('${time!=null ? time.toString() : "Time is not Mentioned Here!"}'),
                          ],
                        ),
                      ),

                    ],
                  ),
            ),
            ),

             Positioned(
               top: 20.0,
               right: screenwidth / 20.0  - 15,
                 child: Hero(
                   tag: image != null ? image : noimage,
                   child: Container(
                     width: 100,
                     height: 100,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: NetworkImage(
                           image!=null ? image : noimage,
                         ),
                         fit: BoxFit.cover,
                       ),
                       borderRadius: BorderRadius.circular(20),
                     ),
                   ),
                 ),
             ),

          ],


       ),
    );
  }
}
