import 'package:flutter/material.dart';
import 'package:medlink/active_medication.dart';
import 'package:medlink/basic_details.dart';
import 'package:medlink/contacts.dart';
import 'package:medlink/current_medicines.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/insurances.dart';
import 'package:medlink/main.dart';
import 'package:medlink/miscellaneous.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/prescriptions.dart';
import 'package:medlink/prev_med_conditions.dart';
import 'package:medlink/scans.dart';
import 'package:medlink/settings.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //width: 50,
        child: ListView(
          children: <Widget>[
            Container(
              height: 15,
              color: Colors.teal[50],
            ),
            Container(
              height: 150,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Untitled.png'),
                    fit: BoxFit.contain,
                  ),
                  color: Colors.teal[50]),
            ),
            Container(
              height: 15,
              color: Colors.teal[50],
            ),
            ListTile(
              title: Text(
                "HOME",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeN()));
              },
            ),
            ListTile(
              title: Text(
                "BASIC DETAILS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.teal[50],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Basic_details()));
              },
            ),
            ListTile(
              title: Text(
                "ACTIVE MEDICATION",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAppHomePage()));
              },
            ),
            ListTile(
              title: Text(
                "CONTACTS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.teal[50],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => contacts()));
              },
            ),
            ListTile(
              title: Text(
                "INSURANCE",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => insurance()));
              },
            ),
            ListTile(
              title: Text(
                "SCANS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.teal[50],
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => scans()));
              },
            ),
            ListTile(
              title: Text(
                "PREVIOUS MEDICAL CONDITIONS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => prev_med_conditions()));
              },
            ),
            ListTile(
              title: Text(
                "PRESCRIPTIONS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.teal[50],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => presciptions()));
              },
            ),
            ListTile(
              title: Text(
                "MEDICAL NEWS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => miscellaneous()));
              },
            ),
            ListTile(
              title: Text(
                "SETTINGS",
                textAlign: TextAlign.center,
              ),
              tileColor: Colors.teal[50],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

void back() {
  Home();
}
