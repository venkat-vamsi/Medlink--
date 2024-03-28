import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';

class currebt_medicines extends StatefulWidget {
  const currebt_medicines({super.key});

  @override
  State<currebt_medicines> createState() => _currebt_medicinesState();
}

class _currebt_medicinesState extends State<currebt_medicines> {
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => settings()));
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
