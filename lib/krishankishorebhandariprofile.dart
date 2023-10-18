import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nextapp/krishankishorevideosa.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import 'package:marquee/marquee.dart';

import 'kbtutorials.dart'; // Import the marquee package

void main() {
  runApp(KK());
}

class KK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizedBox(height: 60,);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      'assests/mobile_file_2023-09-28_16-39-53.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 90,
                  width: 250,
                 // decoration: BoxDecoration(
                 //    borderRadius: BorderRadius.circular(20),
                 //    border: Border.all(
                 //      color: Colors.black, // Specify the border color here
                 //      width: 2.0,          // Specify the border width here
                 //    ),
                 //  ),

                    child: Center(
                      child: Text(
                        'KRISHNA KISHORE BHANDARI',
                        style: TextStyle(
                          fontSize: 14,                // Adjust the font size as needed
                          color: Colors.blue,          // Change the text color
                          fontWeight: FontWeight.bold, // Specify the font weight
                         // fontStyle: FontStyle.italic, // Specify the font style (e.g., italic)
                          letterSpacing: 1.2,          // Adjust letter spacing
                         // decoration: TextDecoration.underline, // Add text decoration (e.g., underline)
                          decorationColor: Colors.red,           // Specify decoration color
                          //decorationThickness: 2.0,             // Specify decoration thickness
                        ),
                      ),
                    ),
                  ),
                ),



              SizedBox(height: 20),
              // Added spacing between the image and marquee text
              Container(
                height: 50, // Set a fixed height for the Marquee container
                child: _buildMarquee(),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.to(VideoPlayerApp());
                },
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.green, // Specify the border color here
                      width: 2.0,          // Specify the border width here
                    ),
                    color: Colors.green,
                  ),

                    child:
                  const Center(
                    child: Text(
                      'Watch My Videos',
                      style: TextStyle(
                        fontSize: 16,                // Adjust the font size as needed
                        color: Colors.white,          // Change the text color
                        fontWeight: FontWeight.bold, // Specify the font weight
                        // fontStyle: FontStyle.italic, // Specify the font style (e.g., italic)
                        letterSpacing: 1.2,          // Adjust letter spacing
                        // decoration: TextDecoration.underline, // Add text decoration (e.g., underline)
                        decorationColor: Colors.red,           // Specify decoration color
                        //decorationThickness: 2.0,             // Specify decoration thickness
                      ),
                    ),
                  ),
                )


          ),

        ]),
      ),
      )
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text: 'Krishan Kishore Bhandari - '
          ' Lecturer (Mathematics) in SVMIC Srikot Ganganali, Srinagar Garhwal, Uttarakhand'
          ' This channel is for exploring concept of Mathematics for class XI and XII in Easy Way to help Everyone.r'
          'With NCERT solutions for CBSE and Uk Board '
          ' '
          ' ',
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 20.0,
      pauseAfterRound: Duration(seconds: 1),
      style: TextStyle(
        fontSize: 18,                // Adjust the font size as needed
        color: Colors.red,          // Change the text color
        fontWeight: FontWeight.bold, // Specify the font weight
        // fontStyle: FontStyle.italic, // Specify the font style (e.g., italic)
        letterSpacing: 1.2,          // Adjust letter spacing
        // decoration: TextDecoration.underline, // Add text decoration (e.g., underline)
        decorationColor: Colors.red,
        //fontSize: 24, // Set the desired text size
      ),
    );

  }
}
