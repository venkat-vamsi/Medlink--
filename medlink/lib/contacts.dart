import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/settings.dart';

class contacts extends StatelessWidget {
  const contacts({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergency_Contacts',
      // ignore: prefer_const_constructor
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? name1,
      name2,
      name3,
      name4,
      relate1,
      relate2,
      relate3,
      relate4,
      cont1,
      cont2,
      cont3,
      cont4;

  const MyHomePage(
      {super.key,
      this.name1,
      this.name2,
      this.name3,
      this.name4,
      this.relate1,
      this.relate2,
      this.relate3,
      this.relate4,
      this.cont1,
      this.cont2,
      this.cont3,
      this.cont4});

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
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Edit()),
                  );
                },
                child: const Text("Edit")),
          ),
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
      body: SafeArea(
        top: true,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/contacts.jpeg'),
                            fit: BoxFit.contain,
                          )),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                            ),
                            const Text(
                              "NAME",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                name1.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "RELATE",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                              child: Text(
                                relate1.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "CONTACT NUMBER",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                cont1.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                            ),
                            const Text(
                              "NAME",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                name2.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "RELATE",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                              child: Text(
                                relate2.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "CONTACT NUMBER",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                cont2.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "NAME",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                name3.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "RELATE",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                              child: Text(
                                relate3.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "CONTACT NUMBER",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                cont3.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "NAME",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                name4.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "RELATE",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                              child: Text(
                                relate4.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "CONTACT NUMBER",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[50]),
                              child: Text(
                                cont4.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                  width: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final TextEditingController _name1 = TextEditingController();
  final TextEditingController _name2 = TextEditingController();
  final TextEditingController _name3 = TextEditingController();
  final TextEditingController _name4 = TextEditingController();
  final TextEditingController _relate1 = TextEditingController();
  final TextEditingController _relate2 = TextEditingController();
  final TextEditingController _relate3 = TextEditingController();
  final TextEditingController _relate4 = TextEditingController();
  final TextEditingController _cont1 = TextEditingController();
  final TextEditingController _cont2 = TextEditingController();
  final TextEditingController _cont3 = TextEditingController();
  final TextEditingController _cont4 = TextEditingController();

  @override
  void dispose() {
    _name1.dispose();
    _name2.dispose();
    _name3.dispose();
    _name4.dispose();
    _relate1.dispose();
    _relate2.dispose();
    _relate3.dispose();
    _relate4.dispose();
    _cont1.dispose();
    _cont2.dispose();
    _cont3.dispose();
    _cont4.dispose();

    super.dispose();
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
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
              child: TextField(
                controller: _name1,
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 50,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 50,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
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
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
              child: TextField(
                controller: _name4,
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
              child: TextField(
                controller: _relate4,
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
              height: 30,
              width: 40,
            ),
            Container(
              height: 60,
              color: const Color.fromARGB(255, 217, 233, 247),
              child: TextField(
                controller: _cont4,
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
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            name1: _name1.text,
                            name2: _name2.text,
                            name3: _name3.text,
                            name4: _name4.text,
                            relate1: _relate1.text,
                            relate2: _relate2.text,
                            relate3: _relate3.text,
                            relate4: _relate4.text,
                            cont1: _cont1.text,
                            cont2: _cont2.text,
                            cont3: _cont3.text,
                            cont4: _cont4.text,
                          )));
                },
                child: const Text("SAVE"))
          ],
        )),
      ),
    );
  }
}
