import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);
  final String videoUrl;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
      //'https://firebasestorage.googleapis.com/v0/b/flutterfire-courses.appspot.com/o/videos%2FVideo%200?alt=media&token=37c02b1e-cf26-4ff1-b6a0-76501c6afefc',
      // 'https://cdn.pixabay.com/vimeo/328940142/Buttercups%20-%2022634.mp4?width=1304&hash=2df4ff27ac821dcb2174355e8051bd782697fcb4',
    )..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);
        _isLoading = false;
        setState(() {});
      });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return _isLoading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : buildVideoPlayer();
    // Container(
    //   width: size.width,
    //   height: size.height,
    //   color: Colors.black,
    //   child: VideoPlayer(videoPlayerController),
    // );
  }

  Widget buildVideoPlayer() => buildFullScreen(
        AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(videoPlayerController),
        ),
      );

  Widget buildFullScreen(Widget child) {
    final size = videoPlayerController.value.size;
    final width = size.width;
    final height = size.height;

    return FittedBox(
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
