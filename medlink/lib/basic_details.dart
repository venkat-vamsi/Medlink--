import 'package:flutter/material.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/settings.dart';

class Basic_details extends StatelessWidget {
  const Basic_details({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'basic_Details_info',
      // ignore: prefer_const_constructor
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? name,
      age,
      bloodgroup,
      height,
      weight,
      dob,
      add,
      diabetes,
      bp,
      arthritis,
      kidney,
      heart,
      pcod;

  const MyHomePage(
      {super.key,
      this.name,
      this.age,
      this.bloodgroup,
      this.height,
      this.weight,
      this.dob,
      this.add,
      this.diabetes,
      this.bp,
      this.arthritis,
      this.kidney,
      this.heart,
      this.pcod});

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
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
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
                        height: 70,
                        width: 400,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal[50]),
                        child: Text(
                          name.toString(),
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
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                            child: Text(
                              age.toString(),
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
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                            child: Text(
                              bloodgroup.toString(),
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
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.teal[50]),
                            child: Text(
                              height.toString(),
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
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.teal[50]),
                            child: Text(
                              weight.toString(),
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
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                            child: Text(
                              dob.toString(),
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
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                            child: Text(
                              add.toString(),
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
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
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
                        const Text("DIABETES"),
                        Text(
                          diabetes.toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("B.P."),
                        Text(bp.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("HEART DISEASES"),
                        Text(heart.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("KIDNEY"),
                        Text(kidney.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("PCOD"),
                        Text(pcod.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ]),
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _blood_group = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _add = TextEditingController();
  final TextEditingController _sugar = TextEditingController();

  final TextEditingController _bp = TextEditingController();
  final TextEditingController _heart = TextEditingController();
  final TextEditingController _kidney = TextEditingController();
  final TextEditingController _pcod = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _height.dispose();
    _blood_group.dispose();
    _weight.dispose();
    _dob.dispose();
    _add.dispose();
    _sugar.dispose();
    _bp.dispose();
    _heart.dispose();
    _kidney.dispose();
    _pcod.dispose();
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
            SizedBox(
              height: 70,
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "User Name",
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
            ),
            SizedBox(
              height: 70,
              child: TextField(
                controller: _age,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Age",
                  labelText: 'AGE',
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
                controller: _blood_group,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Blood Group",
                  labelText: 'BLOOD GROUP',
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
                controller: _height,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Height",
                  labelText: 'HEIGHT',
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
                controller: _weight,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "Weight",
                  labelText: 'WEIGHT',
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
                controller: _dob,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "DOB",
                  labelText: 'DAte Of Birthday',
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
                controller: _add,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  hintText: "your city ,state",
                  labelText: 'CITY/DISTRICT , STATE',
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
                      const Text("DIABETES"),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _sugar,
                          decoration: InputDecoration(
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
                      const Text("BLOOD PRESSURE"),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _bp,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: 'BLOOD PRESSURE',
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
                      const Text("KIDNEY ISSUES"),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _kidney,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: 'KIDNEY ISSUES',
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
                      const Text("HEART ISSUES"),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _heart,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: 'HEART ISSUES',
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
                      const Text("PCOD"),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _pcod,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 40.0),
                            hintText: "Yes/No",
                            labelText: 'PCOD',
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
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            age: _age.text,
                            name: _name.text,
                            height: _height.text,
                            weight: _weight.text,
                            bloodgroup: _blood_group.text,
                            dob: _dob.text,
                            add: _add.text,
                            diabetes: _sugar.text,
                            bp: _bp.text,
                            heart: _heart.text,
                            kidney: _kidney.text,
                            pcod: _pcod.text,
                          )));
                },
                child: const Text("SAVE"))
          ],
        )),
      ),
    );
  }
}
// ignore: unused_import

/*import 'package:flutter/material.dart';

class Basic_details extends StatelessWidget {
  const Basic_details({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'basic_Details_info',
      // ignore: prefer_const_constructor
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? name,
      age,
      bloodgroup,
      height,
      weight,
      dob,
      add,
      diabetes,
      bp,
      arthritis,
      kidney,
      heart,
      pcod;

  const MyHomePage(
      {super.key,
      this.name,
      this.age,
      this.bloodgroup,
      this.height,
      this.weight,
      this.dob,
      this.add,
      this.diabetes,
      this.bp,
      this.arthritis,
      this.kidney,
      this.heart,
      this.pcod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            color: Colors.black,
            tooltip: 'Bubble'),
        title: const Text('MEDLINK+'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: 25,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Edit()),
                );
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://picsum.photos/seed/718/600',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
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
                      height: 70,
                      width: 400,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Text(
                        name.toString(),
                        style: const TextStyle(
                          fontSize: 30,
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
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: Text(
                            age.toString(),
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
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: Text(
                            bloodgroup.toString(),
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
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: Text(
                            height.toString(),
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
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: Text(
                            weight.toString(),
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
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: Text(
                            dob.toString(),
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
                          height: 50,
                          width: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: Text(
                            add.toString(),
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
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
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
                  color: Colors.grey,
                ),
                child: ListWheelScrollView(itemExtent: 50, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("DIABETES"),
                      Text(
                        diabetes.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("B.P."),
                      Text(bp.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("HEART DISEASES"),
                      Text(heart.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("KIDNEY"),
                      Text(kidney.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("PCOD"),
                      Text(pcod.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ]),
              ),
            ],
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _blood_group = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _add = TextEditingController();
  final TextEditingController _sugar = TextEditingController();

  final TextEditingController _bp = TextEditingController();
  final TextEditingController _heart = TextEditingController();
  final TextEditingController _kidney = TextEditingController();
  final TextEditingController _pcod = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _height.dispose();
    _blood_group.dispose();
    _weight.dispose();
    _dob.dispose();
    _add.dispose();
    _sugar.dispose();
    _bp.dispose();
    _heart.dispose();
    _kidney.dispose();
    _pcod.dispose();
    super.dispose();
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
        title: const Text('YOUR DETAILS'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: 25,
        ),
        backgroundColor: Colors.white,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "User Name",
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
              ),
              SizedBox(
                height: 70,
                child: TextField(
                  controller: _age,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "Age",
                    labelText: 'AGE',
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
                  controller: _blood_group,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "Blood Group",
                    labelText: 'BLOOD GROUP',
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
                  controller: _height,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "Height",
                    labelText: 'HEIGHT',
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
                  controller: _weight,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "Weight",
                    labelText: 'WEIGHT',
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
                  controller: _dob,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "DOB",
                    labelText: 'DAte Of Birthday',
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
                  controller: _add,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    hintText: "your city ,state",
                    labelText: 'CITY/DISTRICT , STATE',
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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: ListWheelScrollView(
                  itemExtent: 80,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("DIABETES"),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: TextField(
                            controller: _sugar,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              hintText: "Yes/No",
                              labelText: 'DIABETES',
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
                        const Text("BLOOD PRESSURE"),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: TextField(
                            controller: _bp,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              hintText: "Yes/No",
                              labelText: 'BLOOD PRESSURE',
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
                        const Text("KIDNEY ISSUES"),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: TextField(
                            controller: _kidney,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              hintText: "Yes/No",
                              labelText: 'KIDNEY ISSUES',
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
                        const Text("HEART ISSUES"),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: TextField(
                            controller: _heart,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              hintText: "Yes/No",
                              labelText: 'HEART ISSUES',
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
                        const Text("PCOD"),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: TextField(
                            controller: _pcod,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              hintText: "Yes/No",
                              labelText: 'PCOD',
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              age: _age.text,
                              name: _name.text,
                              height: _height.text,
                              weight: _weight.text,
                              bloodgroup: _blood_group.text,
                              dob: _dob.text,
                              add: _add.text,
                              diabetes: _sugar.text,
                              bp: _bp.text,
                              heart: _heart.text,
                              kidney: _kidney.text,
                              pcod: _pcod.text,
                            )));
                  },
                  child: const Text("SAVE"))
            ],
          ),
        ),
      ),
    );
  }
}*/
