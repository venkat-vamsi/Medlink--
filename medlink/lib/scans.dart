/*import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/settings.dart';
import 'menu.dart';
import 'package:image_picker/image_picker.dart';


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
                    ),
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
            onPressed: _pickImage,
            child: const Icon(Icons.add),
            splashColor: Colors.teal[50],
            backgroundColor: Colors.black,
            elevation: 10,
          ),
        ));
  }
}*/
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlink/homepage.dart';
import 'dart:io';

import 'package:medlink/menu.dart';
import 'package:medlink/settings.dart';

class scans extends StatefulWidget {
  @override
  _scansState createState() => _scansState();
}

/*class _scansState extends State<scans> {
  XFile? _pickedImage; // Initialize with null
  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _pickedImage = pickedFile;
        _imagePath = pickedFile?.path;
      });
    } catch (e) {
      // Handle the error, if any
      print('Error: $e');
    }
  }*/
class _scansState extends State<scans> {
  List<String> _imagePaths = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imagePaths.add(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle the error, if any
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        // your app bar properties
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(
                height: 50,
              ),
              for (var imagePath in _imagePaths)
                Center(
                    child: imagePath != null
                        ? Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(imagePath)),
                                fit: BoxFit.contain,
                              ),
                            ))
                        : Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.teal[50],
                            ))),
              SizedBox(
                height: 50,
              ),
              for (var imagePath in _imagePaths)
                Center(
                    child: imagePath != null
                        ? Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(imagePath)),
                                fit: BoxFit.contain,
                              ),
                            ))
                        : Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            )))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: const Icon(Icons.add),
        splashColor: Colors.teal[50],
        backgroundColor: Colors.black,
        elevation: 10,
      ),
    );
  }
}
