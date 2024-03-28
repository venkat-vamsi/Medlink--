import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/news/homenews.dart';

class Basic_details extends StatefulWidget {
  const Basic_details({Key? key}) : super(key: key);

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<Basic_details> {
  final User? user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot? userData;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    print('Fetching user data...');
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();
      if (doc.exists) {
        setState(() {
          userData = doc;
        });
      } else {
        setState(() {
          userData = null;
        });
        print('User data not found.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> saveDataToFirestore({
    String? name,
    String? age,
    String? bloodgroup,
    String? height,
    String? weight,
    String? dob,
    String? add,
    String? diabetes,
    String? bp,
    String? heart,
    String? kidney,
    String? pcod,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'name': name,
      'age': age,
      'bloodgroup': bloodgroup,
      'height': height,
      'weight': weight,
      'dob': dob,
      'add': add,
      'diabetes': diabetes,
      'bp': bp,
      'heart': heart,
      'kidney': kidney,
      'pcod': pcod,
    });
    getUserData();
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
      body: userData != null
          ? SafeArea(
              top: true,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/basic_details.jpeg'),
                                    fit: BoxFit.contain,
                                  )),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "NAME",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                userData!['name'].toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "AGE",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    userData!['age'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "BLOOD GROUP",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    userData!['bloodgroup'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "HEIGHT",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.teal[50]),
                                  child: Text(
                                    userData!['height'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "WEIGHT",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.teal[50]),
                                  child: Text(
                                    userData!['weight'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "DOB",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    userData!['dob'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ADDRESS",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    userData!['add'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "COMMON CHRONIC DISEASES",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal[50],
                        ),
                        child: ListWheelScrollView(itemExtent: 50, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            DIABETES"),
                              Text(
                                userData!['diabetes'].toString() + "      ",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            B.P."),
                              Text(userData!['bp'].toString() + "      ",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            HEART DISEASES"),
                              Text(userData!['heart'].toString() + "      ",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            KIDNEY"),
                              Text(userData!['kidney'].toString() + "      ",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            PCOD"),
                              Text(userData!['pcod'].toString() + "      ",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SafeArea(
              top: true,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/basic_details.jpeg'),
                                    fit: BoxFit.contain,
                                  )),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "NAME",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "AGE",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    '',
                                    //userData!['age'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "BLOOD GROUP",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    '',
                                    //userData!['bloodgroup'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "HEIGHT",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.teal[50]),
                                  child: Text(
                                    '',
                                    //userData!['height'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "WEIGHT",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.teal[50]),
                                  child: Text(
                                    '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "DOB",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    '',
                                    //userData!['dob'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ADDRESS",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.43,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[300]),
                                  child: Text(
                                    '',
                                    //userData!['add'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "COMMON CHRONIC DISEASES",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal[50],
                        ),
                        child: ListWheelScrollView(itemExtent: 50, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            DIABETES"),
                              Text(
                                '',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            B.P."),
                              Text('',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            HEART DISEASES"),
                              Text('',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            KIDNEY"),
                              Text('',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("            PCOD"),
                              Text('',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditDetails(
                onSave: saveDataToFirestore,
                initialData: userData,
              ),
            ),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.black,
        splashColor: Colors.teal[50],
        elevation: 10,
      ),
    );
  }
}

class EditDetails extends StatefulWidget {
  final Function({
    String? name,
    String? age,
    String? bloodgroup,
    String? height,
    String? weight,
    String? dob,
    String? add,
    String? diabetes,
    String? bp,
    String? heart,
    String? kidney,
    String? pcod,
  }) onSave;
  final DocumentSnapshot? initialData;

  EditDetails({required this.onSave, required this.initialData});

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _diabetesController = TextEditingController();
  TextEditingController _bpController = TextEditingController();
  TextEditingController _heartController = TextEditingController();
  TextEditingController _kidneyController = TextEditingController();
  TextEditingController _pcodController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _nameController.text = widget.initialData!['name'] ?? '';
      _ageController.text = widget.initialData!['age'] ?? '';
      _bloodGroupController.text = widget.initialData!['bloodgroup'] ?? '';
      _heightController.text = widget.initialData!['height'] ?? '';
      _weightController.text = widget.initialData!['weight'] ?? '';
      _dobController.text = widget.initialData!['dob'] ?? '';
      _addressController.text = widget.initialData!['add'] ?? '';
      _diabetesController.text = widget.initialData!['diabetes'] ?? '';
      _bpController.text = widget.initialData!['bp'] ?? '';
      _heartController.text = widget.initialData!['heart'] ?? '';
      _kidneyController.text = widget.initialData!['kidney'] ?? '';
      _pcodController.text = widget.initialData!['pcod'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HOME(userId: '')));
          },
          child: Text('MEDLINK+'),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "User Name",
                  labelText: '  NAME',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Age",
                  labelText: '  AGE',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _bloodGroupController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Blood Group",
                  labelText: '  BLOOD GROUP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Height",
                  labelText: '  HEIGHT',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: 300,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Weight",
                  labelText: '  WEIGHT',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _dobController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "DOB",
                  labelText: '  DAte Of Birthday',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "your city ,state",
                  labelText: '  CITY/DISTRICT , STATE',
                  hintMaxLines: 2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.teal[50]),
              child: ListWheelScrollView(
                itemExtent: 80,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("DIABETES            "),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _diabetesController,
                          decoration: InputDecoration(
                            hintText: "Yes/No",
                            labelText: 'yes/no',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("BLOOD PRESSURE"),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _bpController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: ' yes/no',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("KIDNEY ISSUES   "),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _kidneyController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: ' yes/no',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("HEART ISSUES   "),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _heartController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: ' yes/no',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 249, 4, 4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("PCOD                  "),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _pcodController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: ' yes/no',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onSave(
            name: _nameController.text,
            age: _ageController.text,
            bloodgroup: _bloodGroupController.text,
            height: _heightController.text,
            weight: _weightController.text,
            dob: _dobController.text,
            add: _addressController.text,
            diabetes: _diabetesController.text,
            bp: _bpController.text,
            heart: _heartController.text,
            kidney: _kidneyController.text,
            pcod: _pcodController.text,
          );
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.black,
        splashColor: Colors.teal[50],
        elevation: 10,
      ),
    );
  }
}
