import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/news/homenews.dart';

class contacts extends StatefulWidget {
  const contacts({Key? key}) : super(key: key);

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergency_Contacts',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          .collection('contacts')
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
    //String? name,
    String? name1,
    String? name2,
    String? name3,
    String? name4,
    String? relate1,
    String? relate2,
    String? relate3,
    String? relate4,
    String? cont1,
    String? cont2,
    String? cont3,
    String? cont4,
  }) async {
    await FirebaseFirestore.instance.collection('contacts').doc(user?.uid).set({
      'name1': name1,
      'name2': name2,
      'name3': name3,
      'name4': name4,
      'relate1': relate1,
      'relate2': relate2,
      'relate3': relate3,
      'relate4': relate4,
      'cont1': cont1,
      'cont2': cont2,
      'cont3': cont3,
      'cont4': cont4,
    });
    getUserData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeN()));
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HOME(
                          userId: '',
                        )));
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
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal[50],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "NAME",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        userData!['name1'].toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "RELATION",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        userData!['relate1'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "CONTACT NUMBER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        userData!['cont1'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[300],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "NAME",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[400]),
                                      child: Text(
                                        userData!['name2'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "RELATION",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[400],
                                      ),
                                      child: Text(
                                        userData!['relate2'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "CONTACT NUMBER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[400],
                                      ),
                                      child: Text(
                                        userData!['cont2'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal[50],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "NAME",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        userData!['name3'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "RELATION",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        userData!['relate3'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "CONTACT NUMBER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        userData!['cont3'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
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
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal[50],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "NAME",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "RELATION",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "CONTACT NUMBER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[300],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "NAME",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[400]),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "RELATION",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[400],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "CONTACT NUMBER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[400],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal[50],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "NAME",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "RELATION",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "CONTACT NUMBER",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.teal[100],
                                      ),
                                      child: Text(
                                        '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
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
              builder: (context) => Edit(
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

class Edit extends StatefulWidget {
  final Function({
    String? name1,
    String? name2,
    String? name3,
    String? relate1,
    String? relate2,
    String? relate3,
    String? cont1,
    String? cont2,
    String? cont3,
  }) onSave;
  final DocumentSnapshot? initialData;

  Edit({required this.onSave, required this.initialData});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final TextEditingController _name1 = TextEditingController();
  final TextEditingController _name2 = TextEditingController();
  final TextEditingController _name3 = TextEditingController();

  final TextEditingController _relate1 = TextEditingController();
  final TextEditingController _relate2 = TextEditingController();
  final TextEditingController _relate3 = TextEditingController();

  final TextEditingController _cont1 = TextEditingController();
  final TextEditingController _cont2 = TextEditingController();
  final TextEditingController _cont3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _name1.text = widget.initialData!['name1'] ?? '';
      _name2.text = widget.initialData!['name2'] ?? '';
      _name3.text = widget.initialData!['name3'] ?? '';
      _relate1.text = widget.initialData!['relate1'] ?? '';
      _relate2.text = widget.initialData!['relate2'] ?? '';
      _relate3.text = widget.initialData!['relate3'] ?? '';
      _cont1.text = widget.initialData!['cont1'] ?? '';
      _cont2.text = widget.initialData!['cont2'] ?? '';
      _cont3.text = widget.initialData!['cont3'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 25,
          color: Colors.black,
          tooltip: 'Bubble',
        ),
        title: const Text('CONTACT DETAILS'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: 20,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _name1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "   Name",
                  labelText: '   NAME',
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
              width: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _relate1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "How you Relate",
                  labelText: 'RELATION',
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
              width: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _cont1,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Contact number",
                  labelText: 'CONTACT NUMBER',
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
              height: 70,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _name2,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Name",
                  labelText: 'NAME',
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
              width: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _relate2,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "How you Relate",
                  labelText: 'RELATION',
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
              width: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _cont2,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Contact number",
                  labelText: 'CONTACT NUMBER',
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
              height: 70,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _name3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Name",
                  labelText: 'NAME',
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
              width: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _relate3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "How you Relate",
                  labelText: 'RELATION',
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
              width: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.teal[50],
              child: TextField(
                controller: _cont3,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Contact number",
                  labelText: 'CONTACT NUMBER',
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
              height: 50,
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onSave(
            name1: _name1.text,
            name2: _name2.text,
            name3: _name3.text,
            relate1: _relate1.text,
            relate2: _relate2.text,
            relate3: _relate3.text,
            cont1: _cont1.text,
            cont2: _cont2.text,
            cont3: _cont3.text,
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
