import 'package:flutter/material.dart';

import '../individual_chat/components/camera_view.dart';

class CameraPageView extends StatefulWidget {
  const CameraPageView({super.key});

  @override
  State<CameraPageView> createState() => _CameraPageViewState();
}

class _CameraPageViewState extends State<CameraPageView> {
  @override
  Widget build(BuildContext context) {
    return CameraView();
  }
}
