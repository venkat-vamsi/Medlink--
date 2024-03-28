import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeN()));
            },
            child: Text('MEDLINK+'),
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          child: WebView(
            initialUrl: widget.blogUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
