import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'functions.dart';
import 'homescreen.dart';

void main() {
  runApp(contacts());
}

class contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Connect With Me'),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularButton(
                  color: Colors.blue,
                  icon: Icons.mail,
                  onPressed: () {
                    launchEmail();
                    // Add your action for the first button here
                  },
                ),
                CircularButton(
                  color: Colors.green,
                  icon: Icons.message,
                  onPressed: () async {
                    final phoneNumber = "7536868981"; // Replace with your phone number

                    final url = 'sms:$phoneNumber';  // This URL scheme opens the messaging app with your phone number pre-filled

                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      // Handle the error, e.g., by showing an error message to the user
                      print('Could not launch $url');
                    }
                  },
                ),


                GestureDetector(
                  onTap: () {
                    // Add your action for the circular button here
                  },
                  child: Container(
                    width: 60, // Adjust the size as needed
                    height: 60, // Adjust the size as needed
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Image.asset('assets/your_image.png'), // Replace 'assets/your_image.png' with the path to your image
                        onPressed: () {
                          // Add your action for the image button here
                        },
                      ),
                    ),
                  ),
                )
                ,
                CircularButton(
                  color: Colors.red,
                  icon: Icons.person,
                  onPressed: () {
                    // Add your action for the fourth button here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  CircularButton({
    required this.color,
    required this.icon,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 40.0,
          color: Colors.white,
        ),
      ),
    );


  }
}
