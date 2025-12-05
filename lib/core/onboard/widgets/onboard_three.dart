import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/appImages/app_images.dart';

class OnboardThree extends StatelessWidget {
  const OnboardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(27.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Image.asset(AppImages.onb3),
          Spacer(),
          Text(
            "Express yourself to\nthe world",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            "Let your voice be heard on the internet through the OFOFO features on the App without restrictions",
            style: TextStyle(fontSize: 16.sp, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}
