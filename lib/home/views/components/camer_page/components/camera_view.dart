import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'captured_image.dart';
import 'video_view.dart';

List<CameraDescription> cameras = [];

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _cameraController;
  Future<void>? cameraValue;
  bool isRecording = false;
  String videoPath = '';

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0,

            child: Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.flash_on,
                          color: Colors.white,

                          size: 28,
                        ),
                        onPressed: () {
                          // Add your flash action here
                        },
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          try {
                            await _cameraController?.startVideoRecording();
                            setState(() {
                              isRecording = true;
                              videoPath = '';
                            });
                          } catch (e) {
                            print("Error starting video: $e");
                          }
                        },
                        onLongPressUp: () async {
                          try {
                            final XFile? recordedVideo =
                                await _cameraController?.stopVideoRecording();

                            if (recordedVideo != null) {
                              setState(() {
                                isRecording = false;
                                videoPath = recordedVideo.path; // ✅ نحفظ المسار
                              });

                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            VideoView(videoPath: videoPath),
                                  ),
                                );
                              }
                            }
                          } catch (e) {
                            print("Error stopping video: $e");
                          }
                        },
                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child:
                            isRecording
                                ? const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 70,
                                )
                                : const Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.flip_camera_ios,
                          size: 28,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    try {
      final XFile? image = await _cameraController?.takePicture();

      if (image != null && context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CapturedImage(imagePath: image.path),
          ),
        );
      }
    } catch (e) {
      print("Error taking photo: $e");
    }
  }
}
