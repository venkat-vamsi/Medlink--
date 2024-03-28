import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlink/main.dart';

// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

// ignore: camel_case_types
class _splashscreenState extends State<splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            /*Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage('medlink/assets/images/Untitled.png'),
                      fit: BoxFit.cover)),
            ),*/
            //Image.asset("medlink/assets/images/Untitled.png"),
            Image.network(
                'https://firebasestorage.googleapis.com/v0/b/medlink-2f073.appspot.com/o/Untitled.png?alt=media&token=cb0baa8e-37fd-4f1f-a808-451b90c7b51f'),
            /*Text('MEDLINK+',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 40), color: Colors.black)),*/
          ]),
        ),
      ),
      nextScreen: Home(),
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      
      backgroundColor: Color.fromARGB(255, 213, 245, 249),
      animationDuration: const Duration(milliseconds: 2000),
      // pageTransitionType: ,
    );
  }
}
