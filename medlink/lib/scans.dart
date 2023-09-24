import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/settings.dart';
import 'menu.dart';

class scans extends StatelessWidget {
  const scans({super.key});

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
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/scans.jpeg'),
                        fit: BoxFit.contain,
                      )),
                )),
                const SizedBox(
                  height: 50,
                ),
                /*Text(
                'SCANS',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              )*/
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                ),
              ],
            ),
          ]),
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
