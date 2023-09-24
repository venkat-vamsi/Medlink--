import 'package:flutter/material.dart';
import 'package:medlink/active_medication.dart';
import 'package:medlink/basic_details.dart';
import 'package:medlink/contacts.dart';
import 'package:medlink/insurances.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/miscellaneous.dart';
import 'package:medlink/prescriptions.dart';
import 'package:medlink/prev_med_conditions.dart';
import 'package:medlink/scans.dart';
import 'package:medlink/settings.dart';

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          //title: Text('MEDLINK+'),
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
        //extendBodyBehindAppBar: true,

        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(''),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                // Add your content here
                // ...
                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 0.5),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => settings()));
                      },
                      child: Container(
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/profile2.png'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        elevation: 10,
                      )),
                ),

                //BASIC-DETAILS

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Basic_details()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/basic_details.jpeg'),
                                fit: BoxFit.fill)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //ACTIVE MEDICATION

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAppHomePage()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/active_medication.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //CONTACTS

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => contacts()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/contacts.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //INSURANCE

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => insurance()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/insurance.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //SCANS

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => scans()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/scans.jpeg'),
                                fit: BoxFit.fill)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //PREVIOUS MEDICAL CONDITIONS

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => prev_med_conditions()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/prev_med_cond.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //PRESCRIPTIONS

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => presciptions()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/presciptions.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),

                //MISCELLANEOUS

                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 1),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => miscellaneous()));
                      },
                      child: Container(
                        height: 175,
                        width: 350,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/miscellaneous.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
