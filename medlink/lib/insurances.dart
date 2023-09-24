import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/settings.dart';

import 'main.dart';
import 'menu.dart';

class insurance extends StatelessWidget {
  const insurance({super.key});

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          //backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/insurance.jpeg'),
                      fit: BoxFit.contain,
                    )),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Text(
                    'INSURANCES',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                )*/
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  /*Text(
                  'Best Insurance Policies',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                ListTile(
                  title: Text(
                    '• Care Supreme',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                ListTile(
                  title: Text(
                    '• Star Comprehensive',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                ListTile(
                  title: Text(
                    '• Bajaj Allianz Health Guard',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                ListTile(
                  title: Text(
                    '• Star Famliy Health Optima Plan',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),*/
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 70,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
            splashColor: Colors.teal[50],
            backgroundColor: Colors.black,
            elevation: 10,
          ),
        ));
  }
}
