
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nextapp/secondcardreelsviewer.dart';
import 'package:nextapp/krishankishorevideosa.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import 'collabaration.dart';
import 'firebase_options.dart';
import 'krishankishorebhandariprofile.dart';
import 'kbtutorials.dart';
import 'contactscode.dart';
import 'drawer/code.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.green, // Change this to your desired color
      ),
      // home: Column(
      //   children: [
      //     InstagramStoryList(), // Instagram Story Icons
      //     Expanded(
      //       child: VideoList(),
      //     ),
      //   ],
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       // Drawer items...
      //     ],
      //   ),
      // ),
    );
  }
}
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          actions: [
            IconButton(
              icon: Icon(Icons.grass_rounded),
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
              },
            ),
            IconButton(
              icon: Icon(Icons.light),
              onPressed: () {
                Get.changeTheme(ThemeData.light());
              },
            ),
          ],

        title: const Text("Educo"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.greenAccent[400],
      ), //AppBar
      body: Column(
        children: [
          InstagramStoryList(), // Instagram Story Icons
          Expanded(
            child: VideoList(),
          ),
        ],
      ),
    drawer:
    Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: [
    DrawerHeader(
    decoration: BoxDecoration(
    color: Colors.yellow[400],
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       WidgetCircularAnimator(
        size: 100,
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
            'assests/gaurav.jpg',
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    SizedBox(height: 10),
    Text(
    ''' GrootX/  ''',
    style: TextStyle(
    color: Colors.green,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    ),
    ],
    ),
    ),
    SizedBox(height: 20,),
    Container(


    ),

    SizedBox(height: 10,),



    SizedBox(height: 150,),
    Container(
    height: 65,
    child:
    CircularButton(
    color: Colors.blue,
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
    ),
    SizedBox(height: 30,),
    Container(
    height: 65,
    child:
    CircularButton(
    color: Colors.blue,
    icon: Icons.facebook,
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

    ),
      SizedBox(
        height: 20,
      ),
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
      SizedBox(height: 20,),
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
      SizedBox(height: 169,),

      InkWell(
        onTap: (){
          Get.to(CollaborationPage());
        },
        child: Container(
          height: 50,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.red,
             borderRadius: BorderRadius.circular(20),
            // border: Border.all(
               //color: Colors.red, // Specify the border color here
              // width: 2.0,
        ),


          child: Center(
            child: Text(
              'Collaborate With Us',
              style: TextStyle(
                fontSize: 18,                // Adjust the font size as needed
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
        ),
      )  ,

    ] ),

    ),
    // SizedBox(height: 40,),
    // Expanded(
    // child: Container(
    // child: Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: [
    // Text("Rate My App"),
    // RatingBar.builder(
    // initialRating: 0,
    // minRating: 1,
    // direction: Axis.horizontal,
    // allowHalfRating: false,
    // itemCount: 5,
    // itemSize: 40,
    // itemBuilder: (context, _) => Icon(
    // Icons.star,
    // color: Colors.amber,
    // ),
    // onRatingUpdate: (rating) {
    // // Handle the rating update here, e.g., send it to a server.
    // print(rating);
    // },
    // ),
    // ],
    // ),
    // ),
    // )




     //Center
    );  //Scaffold
  }
}

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: videoData.length,
      itemBuilder: (context, index) {
        return VideoCard(video: videoData[index]);
      },
    );
  }
}



class VideoCard extends StatelessWidget {
  final Video video;

  VideoCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
           // Get.to(VideoPage(video: video));
           Get.to(VideoPlayerApp());
           // _loadVideosFromStorage();

          },
          child: Container(

            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assests/mathsgo.jpg', // Replace with the actual path to your local image
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                SizedBox(height: 10.0),
                Text(
                  video.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  video.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),


              ],

            ),



          ),


        ),
        Column(
            children: [

          GestureDetector(
            onTap: () {
            // Get.to(VideoPlayersecondApp());

            },
            child: Container(

              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assests/taton-moise-zWQ7zsBr5WU-unsplash.jpg', // Replace with the actual path to your local image
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                  SizedBox(height: 10.0),
                  Text(
                    video.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    video.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),


                ],

              ),




            ),


          ),

       ] ),
        Column(
            children: [

              GestureDetector(
                onTap: () {
                // Get.to(dkinstavideos());

                },
                child: Container(

                  margin: EdgeInsets.all(12.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assests/newton.jpg', // Replace with the actual path to your local image
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                      SizedBox(height: 10.0),
                      Text(
                        video.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        video.description,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),


                    ],

                  ),




                ),


              ),

            ] ),

      ],

    );


  }
}


class Video {
  final String title;
  final String description;
  final String thumbnailUrl;

  Video({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });
}


List<Video> videoData = [
  Video(
    title: 'Mathematics Basics',
    description: 'Learn the fundamentals of mathematics.',
    thumbnailUrl: 'https://youtu.be/Y_oVpYQaGFs?si=TtNAiwKqmp6nkAZw',
  ),
  // Video(
  //   title: 'History of Science',
  //   description: 'Explore the history of scientific discoveries.',
  //   thumbnailUrl: 'https://example.com/history_thumbnail.jpg',
  // ),
  // Video(
  //   title: 'History of Groot',
  //   description: 'Explore the Guardians of Galaxy.',
  //   thumbnailUrl: 'https://example.com/history_thumbnail.jpg',
  // ),
  // Add more videos to the list
];

class InstagramStoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2, // Two stories/icons
        itemBuilder: (context, index) {
          // Define different CircleAvatar and InkWell properties for each story
          Widget circleAvatar;
          if (index == 0) {
            // First story
            circleAvatar = InkWell(
              onTap: () {

                Fluttertoast.showToast(
                    msg: "This is the profile of Krishna kishore bhandari", // Your toast message
                    toastLength: Toast.LENGTH_SHORT, // You can change the duration
                    gravity: ToastGravity.CENTER, // You can change the position
                   // timeInSecForIosWeb: 2, // You can change the duration on iOS/Web
                    backgroundColor: Colors.black, // You can change the background color
                    textColor: Colors.white,
                );

                Get.to(KK());
              },
              child: CircleAvatar(
                radius: 42, // Adjust the image size as needed
                backgroundImage: AssetImage('assests/dp1.jpg'), // Replace with your image asset path
              ),
            );
          } else {
            // Second story
            circleAvatar = InkWell(
              onTap: () {
                // Handle the onTap action for the second story
              },
              child: CircleAvatar(
                radius: 42, // Adjust the image size as needed
                backgroundImage: AssetImage('assests/dp1.jpg'), // Replace with your image asset path
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80, // Adjust the icon size as needed
                  height: 80, // Adjust the icon size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
                circleAvatar,
              ],
            ),
          );
        },
      ),
    );
  }
}







