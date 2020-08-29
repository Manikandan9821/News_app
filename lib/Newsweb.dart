import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  //web url final varible
  final String Url;
  final String name;

  //constructor with web url
  Webview({this.Url, this.name});

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        title: Text(widget.name),
      ),
      body: widget.Url != null
          ? WebView(
              initialUrl: widget.Url,
              javascriptMode: JavascriptMode.unrestricted,
            )
          : Center(child: CircularProgressIndicator(),),
    );
  }
}
