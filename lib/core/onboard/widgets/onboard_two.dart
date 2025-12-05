import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/appImages/app_images.dart';

class OnboardTwo extends StatelessWidget {
  const OnboardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(27.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Image.asset(AppImages.onb2),
          Spacer(),
          Text(
            "Make new friends\nwith ease",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            "Allowing you to make new Friends is our Number one priority.....",
            style: TextStyle(fontSize: 16.sp, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}
