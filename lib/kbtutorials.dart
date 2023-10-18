import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'mathsquiz.dart';
import 'mathsquiz2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: VideoPickerScreen(),
    );
  }
}

class VideoPickerScreen extends StatefulWidget {
  @override
  _VideoPickerScreenState createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  List<String> videoUrls = [];
  List<VideoPlayerController> _controllers = [];
  List<File> _videoFiles = [];
  List<TextEditingController> _descriptionControllers = [];

  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordCorrect = false;
  final String correctPassword = "Groot"; // Replace with your desired password

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
    fetchVideoUrls();
  }

  Future<void> _pickVideo() async {
    // Show password dialog
    await _showPasswordDialog();

    if (!_isPasswordCorrect) {
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true, // Allow multiple video selection
    );

    if (result != null) {
      setState(() {
        for (var file in result.files) {
          var videoFile = File(file.path!);
          _videoFiles.add(videoFile);
          var controller = VideoPlayerController.file(videoFile)
            ..initialize().then((_) {
              setState(() {});
            });
          _controllers.add(controller);
          controller.play();
          _descriptionControllers.add(TextEditingController());

          // Upload the selected video to Firebase Storage
          uploadVideoToFirebaseStorage(videoFile);
        }
      });
    }
  }


  Future<void> _showPasswordDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Password"),
          content: Form(
            key: _passwordFormKey,
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value != correctPassword) {
                  return "Incorrect password";
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (_passwordFormKey.currentState!.validate()) {
                  _isPasswordCorrect = true;
                  Get.back();
                }
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  /// du
  Future<void> uploadVideoToFirebaseStorage(File videoFile) async {
    try {
      String videoFileName = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique filename
      Reference storageReference = FirebaseStorage.instance.ref().child('videos/$videoFileName.mp4');

      UploadTask uploadTask = storageReference.putFile(videoFile);
      await uploadTask.whenComplete(() => null);

      String videoUrl = await storageReference.getDownloadURL();
      // You can now use 'videoUrl' to access the uploaded video on Firebase Storage.
      print('Video URL: $videoUrl');

      // You may want to save this URL in a database or use it in your app as needed.
    } catch (error) {
      print('Error uploading video: $error');
    }
  }

  Future<void> fetchVideoUrls() async {
    try {
      // Create a reference to the "videos" folder in Firebase Storage
      Reference videosReference = FirebaseStorage.instance.ref().child('videos');

      // List the items (videos) in the "videos" folder
      ListResult result = await videosReference.listAll();

      // Extract the download URLs of the videos
      List<String> urls = [];
      for (var item in result.items) {
        String url = await item.getDownloadURL();
        urls.add(url);
      }

      // Update the videoUrls list and trigger a UI update
      setState(() {
        videoUrls = urls;
      });
    } catch (error) {
      print('Error fetching video URLs: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KB TUTORIALS"),
        titleSpacing: 0.0, // Remove the extra 0 in titleSpacing
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.0, // Remove the extra 0 in elevation
        backgroundColor: Colors.greenAccent[400],
      ),

        endDrawer: Container(
          height: 543,
          child: Drawer(
            child: Container(
              //    height: double.infinity,
              // width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.b,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.green,  // The border color
                  width: 2.0,

                ),
              ),
              child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      child: CircleAvatar(
                        radius: 80, // You can adjust the radius as needed
                        backgroundImage: AssetImage('assests/dp1.jpg'),
                        // Replace with your image path
                      ),

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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue, // Change the color as desired
                            ),
                            child: Center(
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
                    SizedBox(height: 20,),
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

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _controllers.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: _controllers[index].value.aspectRatio,
                        child: VideoPlayer(_controllers[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _descriptionControllers[index],
                          decoration: InputDecoration(
                            hintText: "Video Description",
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_controllers[index].value.isPlaying) {
                                _controllers[index].pause();
                              } else {
                                _controllers[index].play();
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              _controllers[index].value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Call the function to upload the selected videos to Firebase Storage
                              for (var videoFile in _videoFiles) {
                                uploadVideoToFirebaseStorage(videoFile);
                              }
                            },
                            child: Text("Upload Videos to Firebase"),
                          )

                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickVideo,
        child: Icon(Icons.add_outlined),
      ),
      
    );
  }
}





