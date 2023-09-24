import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/settings.dart';

import 'main.dart';
import 'menu.dart';

class prev_med_conditions extends StatelessWidget {
  const prev_med_conditions({super.key});

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
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/prev_med_cond.jpeg'),
                      fit: BoxFit.contain,
                    )),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Text(
                    'PREVIOUS MEDICAL CONDITIONS',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                )*/
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
                width: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 400,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
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
