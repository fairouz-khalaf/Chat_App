import 'package:chat_app/home/views/components/individual_chat/components/icon_creation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20.w),
              IconCreation(
                icon: Icons.camera_alt,
                text: 'Camera',
                color: Colors.red,
              ),
              SizedBox(width: 40.w),
              IconCreation(
                icon: Icons.image,
                text: 'Gallery',
                color: Colors.purple,
              ),
              SizedBox(width: 40.w),
              IconCreation(
                icon: Icons.file_copy,
                text: 'Document',
                color: Colors.deepPurple,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              IconCreation(
                icon: Icons.location_on,
                text: 'Location',
                color: Colors.lightGreen,
              ),
              SizedBox(width: 40.w),
              IconCreation(
                icon: Icons.person,
                text: 'Contact',
                color: Colors.blue,
              ),
              SizedBox(width: 40.w),
              IconCreation(
                icon: Icons.mic,
                text: 'Audio',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
