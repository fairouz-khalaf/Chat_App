import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.videoPath});
  final String videoPath;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {}); // Update the UI after initialization
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 27),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.crop_rotate, color: Colors.white, size: 27),
            onPressed: () {
              // Handle the check action
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.white,
              size: 27,
            ),
            onPressed: () {
              // Handle the close action
            },
          ),
          IconButton(
            icon: const Icon(Icons.title, color: Colors.white, size: 27),
            onPressed: () {
              // Handle the send action
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white, size: 27),
            onPressed: () {
              // Handle the delete action
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child:
                    _controller.value.isInitialized
                        ? SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: SizedBox(
                              width: _controller.value.size.width,
                              height: _controller.value.size.height,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                        )
                        : Container(),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  maxLines: 5,
                  minLines: 1,

                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 8.r,
                        backgroundColor: Colors.teal,
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            // Handle the send action
                          },
                        ),
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 20,
                    ),
                    hintText: 'Add a caption...',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 33,
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
