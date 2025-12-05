import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/appImages/app_images.dart';

class OnboardFirst extends StatelessWidget {
  const OnboardFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(27.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Image.asset(AppImages.onb1),
          Spacer(),
          Text(
            "Connect with Friends\nand Family",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            "Connecting with Family and Friends provides a sense of belonging and security ",
            style: TextStyle(fontSize: 16.sp, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}
