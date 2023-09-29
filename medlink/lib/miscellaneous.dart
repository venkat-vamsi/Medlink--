import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/settings.dart';
//import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import 'main.dart';
import 'menu.dart';

class miscellaneous extends StatelessWidget {
  const miscellaneous({super.key});

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
                context, MaterialPageRoute(builder: (context) => HOME()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => settings()));
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: WebView(
        initialUrl:
            'https://news.google.com/topics/CAAqIQgKIhtDQkFTRGdvSUwyMHZNR3QwTlRFU0FtVnVLQUFQAQ?ceid=US:en&oc=3',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          // You can use the webViewController to interact with the WebView
        },
        onPageStarted: (String url) {
          // Handle page loading started
        },
        onPageFinished: (String url) {
          // Handle page loading finished
        },
        onWebResourceError: (WebResourceError error) {
          // Handle web resource errors
          print("Web resource error: $error");
        },
      ),
    );
  }
}
