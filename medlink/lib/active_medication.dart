import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:medlink/news/homenews.dart';
import 'package:medlink/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class Medication {
  String id;
  String name;
  TimeOfDay time;

  Medication({
    required this.id,
    required this.name,
    required this.time,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedLink+',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  List<Medication> medications = [];
  late CollectionReference medicationCollection;
  late User? user;
  AudioPlayer audioPlayer = AudioPlayer();
  String soundUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  late Timer medicationTimer;

  void _checkMedicationTimes() {
    medicationTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final currentTime = TimeOfDay.now();
      for (var medication in medications) {
        if (currentTime == medication.time) {
          // Calculate the duration until the next scheduled time
          final now = DateTime.now();
          final scheduledTime = DateTime(now.year, now.month, now.day,
              medication.time.hour, medication.time.minute);
          final durationUntilNextTime = scheduledTime.isBefore(now)
              ? scheduledTime.add(const Duration(days: 1)).difference(now)
              : scheduledTime.difference(now);

          // Schedule the sound to play after the calculated duration
          Timer(durationUntilNextTime, () {
            _playMedicationSound();
          });
        }
      }
    });
  }

  void _playMedicationSound() async {
    try {
      await audioPlayer.play(soundUrl, isLocal: false);
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  @override
  void dispose() {
    try {
      medicationTimer.cancel();
      audioPlayer.dispose();
    } catch (e) {
      print("Error disposing AudioPlayer: $e");
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    medicationCollection = FirebaseFirestore.instance.collection('medications');
    user = FirebaseAuth.instance.currentUser;
    _loadMedications();
    _checkMedicationTimes();
  }

  void _loadMedications() async {
    if (user == null) {
      return;
    }

    QuerySnapshot querySnapshot = await medicationCollection
        .doc(user!.uid)
        .collection('user_medications')
        .get();

    setState(() {
      medications = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Medication(
          id: doc.id,
          name: data['name'],
          time: TimeOfDay(
            hour: data['hour'],
            minute: data['minute'],
          ),
        );
      }).toList();
    });
  }

  void _setMedicationReminder(String name, TimeOfDay time) async {
    if (user == null) {
      return;
    }

    // ignore: unused_local_variable
    DocumentReference documentReference = await medicationCollection
        .doc(user!.uid)
        .collection('user_medications')
        .add({
      'name': name,
      'hour': time.hour,
      'minute': time.minute,
    });

    // Calculate the duration until the next scheduled time
    final now = DateTime.now();
    final scheduledTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final durationUntilNextTime = scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1)).difference(now)
        : scheduledTime.difference(now);

    // Schedule the sound to play after the calculated duration
    Timer(durationUntilNextTime, () {
      _playMedicationSound();
    });

    _loadMedications();
  }

  void _renameMedicationReminder(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String newName = medications[index].name;
        return AlertDialog(
          title: const Text('Rename Medication Reminder'),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
            decoration: const InputDecoration(
              labelText: 'New Name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await medicationCollection
                    .doc(user!.uid)
                    .collection('user_medications')
                    .doc(medications[index].id)
                    .update({'name': newName});

                setState(() {
                  medications[index].name = newName;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Rename'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMedicationReminder(int index) async {
    if (user == null) {
      return;
    }

    await medicationCollection
        .doc(user!.uid)
        .collection('user_medications')
        .doc(medications[index].id)
        .delete();

    setState(() {
      medications.removeAt(index);
    });
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return selectedTime;
  }

  void _stopSound() {
    audioPlayer.stop();
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                if (medications.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Reminders'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: medications.asMap().entries.map((entry) {
                              final index = entry.key;
                              final medication = entry.value;
                              return ListTile(
                                title: Text(
                                  'Medication ${index + 1}: ${medication.name}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Time: ${medication.time.format(context)}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _renameMedicationReminder(index),
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          _deleteMedicationReminder(index),
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No reminders set yet'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const BeveledRectangleBorder(),
                backgroundColor: Colors.transparent,
                elevation: 10,
              ),
              child: Container(
                height: 200,
                width: 300,
                padding: const EdgeInsets.all(20),
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Text(
                  'Reminders',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? selectedTime = await _selectTime(context);
                if (selectedTime != null) {
                  int reminderIndex = medications.length + 1;
                  showDialog(
                    context: context,
                    builder: (context) {
                      String medicationName = 'Medication $reminderIndex';
                      return AlertDialog(
                        title: const Text('Set Medication Reminder'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              onChanged: (value) {
                                medicationName = value;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Medication Name',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Time: ${selectedTime.format(context)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              _setMedicationReminder(
                                  medicationName, selectedTime);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Set'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const BeveledRectangleBorder(),
                backgroundColor: Colors.transparent,
                elevation: 10,
              ),
              child: Container(
                height: 200,
                width: 300,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                color: Colors.teal[50],
                child: const Text(
                  'Set Medication\n    Reminders',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Stop Button
            ElevatedButton(
              onPressed: () {
                _stopSound();
              },

              style: ElevatedButton.styleFrom(

                
                shape: const BeveledRectangleBorder(),
                backgroundColor: Colors.black, // You can change the color
                elevation: 10,
              ),
              child: Container(
                height: 50,
                width: 150,
                alignment: Alignment.center,
                child: const Text(
                  'Stop Sound',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
