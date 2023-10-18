import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextapp/homescreen.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import 'package:marquee/marquee.dart';

import 'firebase_options.dart';
import 'kbtutorials.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(KK());
// }

class signin extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50, // Set a fixed height for the Marquee container
                child: _buildMarquee(),
              ),
              SizedBox(height: 20),
              Center(
                child: WidgetCircularAnimator(
                  size: 250,
                  innerIconsSize: 3,
                  outerIconsSize: 3,
                  innerAnimation: Curves.easeInOutBack,
                  outerAnimation: Curves.easeInOutBack,
                  innerColor: Colors.red,
                  outerColor: Colors.green,
                  innerAnimationSeconds: 10,
                  outerAnimationSeconds: 10,
                  child: ClipOval(
                    child: Image.asset(
                      'assests/educo-process-17.gif',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
            SingleChildScrollView(
                  child: Center(
                    child: Container(
                      height: 450,
                      width: 300,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(
                        //   color: Colors.green,
                        //   width: 2.0,
                        // ),
                        //color: Colors.green,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: emailController, // Initialize the controller
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.red),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: passwordController, // Initialize the controller
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.red),
                            ),
                            obscureText: true, // Hide the password
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 40),
                          InkWell(
                            onTap: () {
                              // Implement Firebase authentication here
                              Get.to(HomePage());
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text: 'WELCOME IN EDUCO -INDIA LEARNING EDUCATIONAL COURSE PLATFORM ',
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 20.0,
      pauseAfterRound: Duration(seconds: 0),
      style: TextStyle(
        fontSize: 18, // Adjust the font size as needed
        color: Colors.green, // Change the text color
        fontWeight: FontWeight.bold, // Specify the font weight
        letterSpacing: 1.2, // Adjust letter spacing
      ),
    );
  }

  Future<void> _registerWithEmailAndPassword(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(), // Use emailController.text
        password: passwordController.text, // Use passwordController.text
      );

      // Registration successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );

      // You can navigate to a new screen or perform other actions here.
      // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      // Registration failed, handle errors and show appropriate messages.
      print('Registration error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}


