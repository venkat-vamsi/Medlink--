import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medlink/active_medication.dart';
import 'package:medlink/basic_details.dart';
import 'package:medlink/contacts.dart';
import 'package:medlink/insurances.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/miscellaneous.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/prescriptions.dart';
import 'package:medlink/prev_med_conditions.dart';
import 'package:medlink/scans.dart';
import 'package:medlink/settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HOME extends StatefulWidget {
  const HOME({super.key, required String userId});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: NavigationDrawerWidget(),
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
                Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment(0, 0.5),
                  child: ElevatedButton(
                      onPressed: _pickImage,
                      child: Container(
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: _imagePath != null
                                    ? FileImage(File(_imagePath!))
                                    : AssetImage('assets/images/profile2.png')
                                        as ImageProvider,
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
                                image:
                                    AssetImage('assets/images/prev_med.jpeg'),
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
                              image: AssetImage('assets/images/reminders.jpeg'),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
                            )),
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
                              image:
                                  AssetImage('assets/images/mecial_news.jpeg'),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomLeft,
                            )),
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
