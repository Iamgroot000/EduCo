import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contactscode.dart';

void main() {
  runApp(CollaborationPage());
}

class CollaborationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Collaboration Page'),
        // ),
        body: CollaborationContent(),
      ),
    );
  }
}



class CollaborationContent extends StatefulWidget {
  @override
  _CollaborationContentState createState() => _CollaborationContentState();
}

class _CollaborationContentState extends State<CollaborationContent> {
  double _rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _rotationAngle += 95.0;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                transform: Matrix4.rotationZ(_rotationAngle * 0.0174533), // Convert degrees to radians
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Collaborate!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to our collaboration platform!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40, // Set a fixed height for the Marquee
              child: _buildMarquee(),
            ),
            SizedBox(height: 20),
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            InstructionItem(
              title: '1. YouTube Channel',
              description: 'You must have a YouTube channel.',
            ),
            InstructionItem(
              title: '2. YouTube Videos',
              description: 'In your YouTube channel, there must be at least 15 videos.',
            ),
            InstructionItem(
              title: '3. YouTube Subscribers ',
              description: 'You must have a minimum of 100 subscribers on your YouTube channel.',
            ),
            InstructionItem(
              title: '4. Connect With Us ',
              description: 'DM us if you meet all these criteria, DM us on WhatsApp, Instagram, or Gmail.',
            ),
            Center(
              child: InstructionItem(
                title: '4. DM with us  ',
                description: '''
                Your Youtube Channel -
                Your Youtube Channel link -
                Your Name -
                Your Profession-
                '''
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Handle onTap event here
                  },
                  child: CircleAvatar(
                    radius: 40, // Set the radius to half of your desired width/height
                    //backgroundColor: Colors.green, // Background color of the circular avatar
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assests/whatsa.png', // Corrected image asset path
                          width: 80, // Set the width and height to match the CircleAvatar's radius * 2
                          height: 80,
                          fit: BoxFit.cover, // This ensures the image covers the entire circle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                InkWell(
                  onTap: () {
                    // Handle onTap event here
                  },
                  child: CircleAvatar(
                    radius: 40, // Set the radius to half of your desired width/height
                    //backgroundColor: Colors.green, // Background color of the circular avatar
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assests/instagram.png', // Corrected image asset path
                          width: 80, // Set the width and height to match the CircleAvatar's radius * 2
                          height: 80,
                          fit: BoxFit.cover, // This ensures the image covers the entire circle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                Container(
                  height: 68,
                  child:
                CircularButton(
                  color: Colors.blue,
                  icon: Icons.mail,
                  onPressed: () async {
                    final facebookPageUrl = "https://www.facebook.com/gaurav.parmar.56211497?mibextid=ZbWKwL"; // Replace with your Facebook page URL

                    if (await canLaunch(facebookPageUrl)) {
                      await launch(facebookPageUrl);
                    } else {
                      // Handle the error, e.g., by showing an error message to the user
                      print('Could not launch $facebookPageUrl');
                    }
                  },

                ),
                )],

            )
          ],


        ),

      ),

    );

  }

  Widget _buildMarquee() {
    return Marquee(
      text: '''Hi THIS IS GAURAV PARMAR , FOUNDER OF EDUCO  -
''',
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 20.0,
      pauseAfterRound: Duration(seconds: 1),
      style: TextStyle(
        fontSize: 18,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        decorationColor: Colors.red,
      ),
    );
  }
}


class InstructionItem extends StatelessWidget {
  final String title;
  final String description;

  InstructionItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 14),
          ),
        ],

      ),

    );

  }
}
