import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/main.dart';
import 'package:medlink/news/homenews.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeN()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeN()));
          },
          child: Text(
            'MEDLINK+',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Settings',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 28.0,
                //fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
                //decoration: TextDecoration.underline,
                decorationThickness: 2.0,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
              ),
              Text(
                'ABOUT',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
              Text(
                'NOTIFICATIONS',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              Text(
                'PRIVACY & SECURITY',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.key,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'ACCOUNT SETTINGS',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(
                  Icons.help_outline,
                  color: Colors.black,
                ),
              ),
              Text(
                'FAQs',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text(
                  'LOGOUT',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red,
                ),
              ),
              Text(
                'DELETE ACCOUNT',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
