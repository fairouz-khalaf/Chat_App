import 'package:camera/camera.dart';
import 'package:chat_app/home/views/components/camer_page/components/camera_view.dart';
import 'package:chat_app/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // ← حسب تصميمك
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Color(0xFF075E54)),
          home: LoginView(),
        );
      },
    );
  }
}
