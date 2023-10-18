import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

void main() {
  runApp(InstagramVideoPlayerApp());
}

class InstagramVideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InstagramVideoPlayerScreen(),
    );
  }
}

class InstagramVideoPlayerScreen extends StatefulWidget {
  @override
  _InstagramVideoPlayerScreenState createState() =>
      _InstagramVideoPlayerScreenState();
}

class _InstagramVideoPlayerScreenState extends State<InstagramVideoPlayerScreen> {
  late VideoPlayerController _controller;

  Future<String?> fetchInstagramVideoUrl(String instagramLink) async {
    final response = await http.get(Uri.parse(instagramLink));

        if (response.statusCode == 200) {
      final document = parse(response.body);
      final videoElement = document.querySelector("video");
      if (videoElement != null) {
        final videoUrl = videoElement.attributes['src'];
        return videoUrl;
      }
    }

    throw Exception('Failed to load Instagram video');
  }

  void initializeVideoPlayer(String videoUrl) {
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
    fetchInstagramVideoUrl('https://instagram.com/i_.amgroot?igshid=OGQ5ZDc2ODk2ZA==').then((videoUrl) {
      initializeVideoPlayer(videoUrl!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
