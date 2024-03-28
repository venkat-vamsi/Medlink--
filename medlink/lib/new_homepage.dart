import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class New_Homepage extends StatefulWidget {
  @override
  State<New_Homepage> createState() => _New_HomepageState();
}

class _New_HomepageState extends State<New_Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Column(
        children: [
          // Horizontal-sliding web view for news
          Container(
            height: 200, // Adjust the height as needed
            child: WebView(
              initialUrl:
                  'https://news.google.com/topics/CAAqIQgKIhtDQkFTRGdvSUwyMHZNR3QwTlRFU0FtVnVLQUFQAQ?ceid=US:en&oc=3', // Provide the URL for your news
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
