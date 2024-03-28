import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/news/homenews.dart';

class MedicalCondition {
  String text;
  String? imagePath;

  MedicalCondition(this.text, this.imagePath);
}

class prev_med_conditions extends StatefulWidget {
  const prev_med_conditions({Key? key});

  @override
  _PrevMedConditionsPageState createState() => _PrevMedConditionsPageState();
}

class _PrevMedConditionsPageState extends State<prev_med_conditions> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _user;
  TextEditingController conditionController = TextEditingController();
  List<MedicalCondition> medicalConditions = [];
  late CollectionReference conditionsCollection;

  @override
  void initState() {
    super.initState();
    conditionsCollection =
        FirebaseFirestore.instance.collection('prev_medical_conditions');
    _user = _auth.currentUser;
  }

  Future<List<MedicalCondition>> _loadMedicalConditions() async {
    List<MedicalCondition> loadedConditions = [];

    if (_user != null) {
      QuerySnapshot querySnapshot = await conditionsCollection
          .doc(_user!.uid)
          .collection('user_conditions')
          .get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        loadedConditions.add(MedicalCondition(
          data['text'],
          data['imagePath'],
        ));
      });
    }

    return loadedConditions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _loadMedicalConditions(),
        builder: (context, AsyncSnapshot<List<MedicalCondition>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            medicalConditions = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Container(
                      color: Colors.teal[50],
                    ),
                  ),
                  /*Text(
                    'Previous Medical Conditions',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.2,
                        //decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                      ),
                    ),
                  ),*/
                  Text(
                    'Previous Medical Conditions',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        letterSpacing: 1.2,
                        decorationThickness: 2.0,
                      ),
                    ),
                  ),
                  /*Text(
                    'Conditions',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.2,
                        //decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                      ),
                    ),
                  ),*/

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[50],
                        //borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: medicalConditions.isEmpty
                          ? const Center(
                              child: Text(
                                'No medical conditions recorded yet.',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : ListView.builder(
                              itemCount: medicalConditions.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(16),
                                    title: Text(
                                      medicalConditions[index].text,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    subtitle: medicalConditions[index]
                                                .imagePath !=
                                            null
                                        ? Image.file(
                                            File(medicalConditions[index]
                                                .imagePath!),
                                            height: null, // Automatic height
                                            width: null, // Automatic width
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        _deleteMedicalCondition(index);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog();
        },
        tooltip: 'Edit',
        backgroundColor: Colors.black,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Medical Condition'),
          content: Column(
            children: [
              TextField(
                controller: conditionController,
                decoration:
                    const InputDecoration(labelText: 'Medical Condition'),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveMedicalCondition();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMedicalCondition(int index) async {
    try {
      if (_user != null) {
        String documentId = medicalConditions[index].text;
        print('Deleting document with ID: $documentId');

        await conditionsCollection
            .doc(_user!.uid)
            .collection('user_conditions')
            .where('text',
                isEqualTo: documentId) // Use where to match the document
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.delete();
          });
        });

        setState(() {
          medicalConditions.removeAt(index);
        });
      }
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          medicalConditions.add(
            MedicalCondition(
              conditionController.text.trim(),
              pickedFile.path, // Ensure that the path is captured correctly
            ),
          );
          conditionController.clear();
        });
      } else {
        _saveMedicalCondition(); // No image picked, only save text
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _saveMedicalCondition() {
    if (_user != null) {
      String conditionText = conditionController.text.trim();
      String? imagePath = medicalConditions.isNotEmpty
          ? medicalConditions.last.imagePath
          : null;

      if (conditionText.isNotEmpty || imagePath != null) {
        Map<String, dynamic> data = {'text': conditionText};

        if (imagePath != null) {
          data['imagePath'] = imagePath;
        }

        conditionsCollection
            .doc(_user!.uid)
            .collection('user_conditions')
            .add(data);

        setState(() {
          medicalConditions.add(MedicalCondition(conditionText, imagePath));
          conditionController.clear();
        });
      }
    }
  }
}
