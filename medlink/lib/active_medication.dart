import 'package:flutter/material.dart';
import 'package:medlink/current_medicines.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/settings.dart';

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

class Medication {
  String name;
  TimeOfDay time;

  Medication({
    required this.name,
    required this.time,
  });
}

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  List<Medication> medications = [];

  void _setMedicationReminder(String name, TimeOfDay time) {
    setState(() {
      medications.add(
        Medication(
          name: name,
          time: time,
        ),
      );
    });
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return selectedTime;
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
              onPressed: () {
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

  void _deleteMedicationReminder(int index) {
    setState(() {
      medications.removeAt(index);
    });
  }

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => settings()));
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.teal[300],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/active_medication.jpeg'),
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(height: 20),
            /*const Text(
              'Active Medications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),*/
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => currebt_medicines()));
                },
                child: Container(
                  height: 150,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  color: Colors.teal[50],
                  alignment: Alignment.center,
                  child: Text(
                    'Current Medicines',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(),
                  backgroundColor: Colors.transparent,
                  elevation: 10,
                )),
            const SizedBox(height: 30),
            Container(
              height: 5,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  if (medications.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Reminders'),
                          content: Column(
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
                    //SnackBar(content: Text('No reminders set yet'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No reminders set yet'),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 150,
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
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(),
                  backgroundColor: Colors.transparent,
                  elevation: 10,
                )),
            const SizedBox(height: 30),
            Container(
              height: 5,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? selectedTime = await _selectTime(context);
                  if (selectedTime != null) {
                    int reminderIndex = medications.length + 1;
                    // ignore: use_build_context_synchronously
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                              onPressed: () {
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
                //child: const Text('Set Medication Reminder'),
                child: Container(
                  height: 150,
                  width: 300,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  color: Colors.teal[50],
                  child: Text(
                    'Set Medication Reminder',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(),
                  backgroundColor: Colors.transparent,
                  elevation: 10,
                )),
          ],
        ),
      ),
    );
  }
}
