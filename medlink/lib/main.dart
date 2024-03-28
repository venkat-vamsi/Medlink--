import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medlink/anisplash.dart';
import 'package:medlink/contacts.dart';
import 'package:medlink/firebase_options.dart';
import 'package:medlink/new_homepage.dart';
import 'package:medlink/news/homenews.dart';
//import 'package:medlink/firebase_options.dart';
import 'package:medlink/sign_up_page.dart';
import 'homepage.dart';
// ignore: depend_on_referenced_packages
import 'package:flare_flutter/flare_actor.dart';
import 'package:rive/rive.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  tz.initializeTimeZones();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: splashscreen()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Home extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _loginWithEmailAndPassword(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "$username@myapp.com", password: password);

      if (userCredential != null) {
        User user = userCredential.user!;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeN()));
        /*Navigator.push(
            context, MaterialPageRoute(builder: (context) => New_Homepage()));*/
      } else {
        // Handle null userCredential (optional, based on your use case)
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException (error handling same as before)
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Incorrect username or user not found.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
      } else {
        errorMessage = 'An error occurred. Please try again later.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.5), BlendMode.dstATop))),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    //image: AssetImage("assets/images/Untitled.png"),
                    image: AssetImage('assets/images/Untitled.png'),
                    fit: BoxFit.fill,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    'MEDLINK+',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Aadhar Card Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => _loginWithEmailAndPassword(context),
                  child: Text('Login'),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      minimumSize: MaterialStatePropertyAll(Size(200, 35))),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage())),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'SIGN UP',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
