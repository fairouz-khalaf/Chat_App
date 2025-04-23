import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconCreation extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const IconCreation({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30.r,
          child: Icon(icon, size: 30.sp, color: Colors.white),
        ),
        SizedBox(height: 5.h),
        Text(text, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
