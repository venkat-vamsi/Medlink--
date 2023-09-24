import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/menu.dart';
import 'package:medlink/settings.dart';

class presciptions extends StatelessWidget {
  const presciptions({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEDLINK+',
      debugShowCheckedModeBanner: false,
      home: const MyHomepage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
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
          //backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/presciptions.jpeg'),
                          fit: BoxFit.contain,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              /*Text(
                'PRESCRIPTIONS',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),*/
              const SizedBox(
                height: 10,
                width: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.teal[50],
                      height: 400,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 10,
                    ),
                    Container(
                      color: Colors.grey[300],
                      height: 400,
                      width: MediaQuery.of(context).size.width * 0.9,
                      // foregroundDecoration: BoxDecoration(
                      //   borderRadius: BorderRadiusDirectional.all(Radius.circular(25))
                      // ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                      ),
                    ),
                    /*const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 4, 62, 91),
                      height: 200,
                      width: 300,
                      // foregroundDecoration: BoxDecoration(
                      //   borderRadius: BorderRadiusDirectional.all(Radius.circular(25))
                      // ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: Image.asset(
                            'assets/images/pres3.jpeg',
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 4, 62, 91),
                      height: 200,
                      width: 300,
                      // foregroundDecoration: BoxDecoration(
                      //   borderRadius: BorderRadiusDirectional.all(Radius.circular(25))
                      // ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: Image.asset(
                            'assets/images/pres4.jpeg',
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 4, 62, 91),
                      height: 200,
                      width: 300,
                      // foregroundDecoration: BoxDecoration(
                      //   borderRadius: BorderRadiusDirectional.all(Radius.circular(25))
                      // ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: Image.asset(
                            'assets/images/pres5.jpeg',
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),*/
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 70,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
            splashColor: Colors.teal[50],
            backgroundColor: Colors.black,
            elevation: 10,
          ),
        ));
  }
}
