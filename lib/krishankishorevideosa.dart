import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:marquee/marquee.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'contactscode.dart';
import 'krishankishorebhandariprofile.dart';
import 'mathsquiz.dart';
import 'mathsquiz2.dart';

void main() {
  runApp(VideoPlayerApp());
}

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player App',
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("KB Classes"),
          titleSpacing: 0.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.greenAccent[400],
        ),

        endDrawer: Container(
          height: 690,
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                //borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  //color: Colors.green,  // The border color
                  width: 2.0,

                ),
              ),
              child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      child: CircleAvatar(
                        radius: 80, // You can adjust the radius as needed
                        backgroundImage: AssetImage('assests/mobile_file_2023-09-28_16-39-53.jpg'),
                        // Replace with your image path
                      ),

                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.green,
                            )
                          ),
                          child:  InkWell(
                            onTap: (){
                            Get.to(KK());
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Krishan kishore bhandari',
                                      style: TextStyle(
                                        fontSize: 19, // Set your desired font size here
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green, // Set your desired text color here
                                        decoration: TextDecoration.none, // Remove underline
                                        // Add more styling properties if needed
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),)]
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(MathQuiz());
                          },
                          child: Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.green,
                              ),

                            ),
                            child: Image.asset('assests/you.png',fit: BoxFit.cover,),
                          ),

                        ) ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 65,
                      child:
                      CircularButton(
                        color: Colors.blue,
                        icon: Icons.facebook,
                        onPressed: ()  {

                          }

                      ),

                    ),
                    SizedBox(
                        height: 20),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(MathQuiz());
                          },
                          child: Container(
                            width: 100, // Adjust the width as needed
                            height: 100, // Adjust the height as needed
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown, // Change the color as desired
                            ),
                            child: const Center(
                              child: Text(
                                "Maths Quiz 1",
                                style: TextStyle(
                                  color: Colors.white, // Change text color as desired
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(QuizScreen());
                          },
                          child: Container(
                            width: 100, // Adjust the width as needed
                            height: 100, // Adjust the height as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orangeAccent, // Change the color as desired
                            ),
                            child: Center(
                              child: Text(
                                "Maths Quiz 2",
                                style: TextStyle(
                                  color: Colors.white, // Change text color as desired
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),



                      ],
                    ),

                  ]
              ),

            ),
          ),
        ),

        body: VideoPlayerScreen(),

      ),
    );
  }
}


class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  List<String> videoIds = [
    'rDsFxGSyMNY', // Video 1
    'Y_oVpYQaGFs', // Updated with the new video ID
    'Sym_6VXCyeM',
    'GfzI_RIWQew',
    'JB2YWf-A4_E',
    'c5EFrV6Sg0A',
    'dEqZFdCA8Ow',
    'KQI2OVtx4kY',
    'ui2Mz-uLhYQ',
    'nc3Xs4apz0I',
    'QLJ9u33g15I',
    '9L4CA0nE0Bc',
    'ZGtovaC1HBo',
    'kXIol4OZaj8',
    'l4RrfoLD-7A',
    'jiZYZJuIHUQ',
    'HmhPeWitoQ0',
    'refquYucnME',
    'TqmmLdF0ooM',
    '4-oRMyMY6Xk',
    'Fy-Kulaqzs',
    'rxUJ6o-b6SU',
    'ENvXOrjIsyA',
    '7G3YSPVwmc',
    'PqQw2mx0RYI',
    '3gA0ai4ugxU',
    'zeeb4gTF8Xw',
    'NplbUn-qwFM',
    'zfb3Lqqdq-s',
    'vaBc6vD_46',
    'kqyevybvzzw',
    'kD6DbZ4AMLY',
    'hNMJyG4-vps',
    'Tyo9fQF9CQA',
    'gdg_Eyj1yUQ',


    'https://youtu.be/QLJ9u33g15I?si=Sf676QTGPrlxyonN',
    '',
    // Add more video IDs here
  ];

  List<String> videoDescriptions = [
    'The first video is about this that alana falana dhimkana etc..',
    'The tbdbdn dbjdd djsdk b bjdjdn nbdsdjwddnndkdm  ndjdndn jdjdjdn bdjsdjdn.',
    'AMAZING TRICK WITH NUMBER || Trick to find your friends number ||',
    'MATHEMATICS MAGIC TRICK"||Is it mathematical trick or just a Coincident|| Fun with Cards',
    'MATHEMATICS MAGIC TRICK"||I Will Read Your Mind😎😎|| Mathematical Explanation of Last Trick||'
    'MATHEMATICS MAGIC TRICK"||I will read your Mind 😎😎ll Must watch video||'
    'Log का उपयोग||Real life Application of Log || Logarithms Basic Concept Part V ||'
    'Change of base formula of log || Logarithm Basic Concept Part - IV |',
    ' Logarithmic Basic Concept Part III || Rules of log ( with proof)',
    'Logarithms Basic Concept Part II || Fundamental Properties||',
    'logarithms Basic concept. Easiest method to understand.',
    'THREE DIMENSIONAL GEOMETRY || CHAPTER 11 || NCERT CLASS XII',
    'THREE DIMENSIONAL GEOMETRY || CHAPTER 11 || NCERT CLASS XII ||EXERCISE 11.1||',
    'Three Dimensional Geometry ||Ncert class XII || Equation Of Line ||',
    'Three Dimensional Geometry||Ncert Class XII||Equation Of Line Two Point Form',
    'Three Dimensional Geometry ||Ncert Class XII|| Angle between two Lines ||',
    'Three Dimensional Geometry (Ncert class XII) || Shortest Distance between Two Skew Lines||',
    'Three Dimensional Geometry||Class XII (Ncert)||Shortest Distance Between Two Skew Lines Part II||',
    'Trigonometric Identities याद नही रहती तो solution है "SUPER HEXAGON" || Short Trick for Identities||',
    'अब Trigonometric values निकालना बांए हाथ का खेल || Trigonometric values by LEFT HAND TRICK',
    'What is the Unit Circle?|| Trigonometric ratios और functions में confused हैं तो unit Circle|| '
    'INVERSE TRIGONOMETRIC FUNCTIONS (CLASS-XII)',
    'INVERSE TRIGONOMETRIC FUNCTIONS (CLASS XII)-2'
    'Inverse Trigonometric Functions (Class-XII)-3',
    'INVERSE TRIGONOMETRIC FUNCTION (CLASS-XII)-4',
    'INVERSE TRIGONOMETRIC FUNCTIONS (Examples based on properties)-5',
    'INVERSE TRIGONOMETRIC FUNCTIONS (CLASS-XII)-6',
    'INVERSE TRIGONOMETRIC FUNCTIONS (CLASS-XII)-7',
    'INVERSE TRIGONOMETRIC FUNCTIONS (CLASS-XII)-8',
    'RELATIONS AND FUNCTIONS (CLASS-XI)',
    '2.संबंध एवं फलन{कक्षा -एकादश(XI)}',
    'संबंध और फलन(कक्षा -एकादश)',
    'संबंध और फलन(कक्षा -एकादश)',
    'संबंध और फलन{कक्षा -एकादश(XI)}',
    'संबंध और फलन(कक्षा -एकादश)',

    // Add descriptions for more videos here
  ];

  int currentVideoIndex = 0;
  bool descriptionVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoIds[0],
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  void _playVideo(int index) {
    setState(() {
      currentVideoIndex = index;
      descriptionVisible = true;
    });
    _controller.load(videoIds[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ),
        if (descriptionVisible)
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              border: Border.all(color: Colors.white),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Video Description:\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: videoDescriptions[currentVideoIndex],
                      style: TextStyle(
                        color: Colors.amber,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: videoIds.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: TextEditingController(text: videoDescriptions[index]),
                      onChanged: (newDescription) {
                        setState(() {
                          videoDescriptions[index] = newDescription;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Video ${index + 1} Description',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _playVideo(index);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Video thumbnail as the background
                        Image.asset(
                          'assests/taton-moise-zWQ7zsBr5WU-unsplash.jpg',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        // Play button overlay
                        Icon(
                          Icons.play_circle_filled,
                          color: Colors.white,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    height: 37,
                    width: 80,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Icon(
                        //   //Icons.play_arrow, // Replace with your desired icon
                        //  // color: Colors.white, // Customize the icon color as needed
                        // ),
                        Center(
                          child: Text(
                            'Video ${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Customize the text color as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  )


                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
