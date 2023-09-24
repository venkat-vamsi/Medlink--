import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlink/homepage.dart';
import 'package:medlink/main.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Password Requirements'),
      content: Text(
          '•First four characters of your password should be FIRST FOUR LETTERS OF YOUR NAME in Aadhar-Card.\n\n•Last four characters of your password should be YOUR YEAR OF BIRTH\n\n•Ex: vams2004'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signUpWithEmailAndPassword(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Regular expression pattern to match 4 alphabets followed by 4 digits
    RegExp passwordPattern = RegExp(r"^[a-zA-Z]{4}\d{4}$");

    if (!passwordPattern.hasMatch(password)) {
      // Password does not meet the requirement
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Password must contain exactly 4 alphabets and 4 digits.'),
        ),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "$username@myapp.com", // Using a dummy email with username
        password: password,
      );

      // User registration successful, you can navigate to the home page or perform other actions here
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        // Handle weak password error
        errorMessage = 'Password should be your date of birth.';
      } else if (e.code == 'email-already-in-use') {
        // Handle email already in use error
        errorMessage = 'Username already registered.';
      } else {
        // Handle other errors
        errorMessage = 'Invalid username or password. Try without spaces.';
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
              Colors.white.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
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
                    image: AssetImage('assets/images/Untitled.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Text(
                  'MEDLINK+',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Aadhar Card Number',
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'xxxx1234',
                      ),
                    ),
                  ),
                  Tooltip(
                    message:
                        'Password should contain exactly 4 alphabets and 4 digits',
                    child: IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        size: 20,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return InfoDialog(); // Show the custom InfoDialog widget
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _signUpWithEmailAndPassword(context);
                  Navigator.of(context).pop();
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
