import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/appImages/app_images.dart';
import 'package:social_media/core/splash/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SplashViewModel.redirectPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(AppImages.logo, width: 181.w, height: 60.h),
          ),
          Positioned(
            top: 121,
            right: 68,
            child: Container(
              width: 49.w,
              height: 49.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 199,
            left: 83,
            child: Container(
              width: 31.w,
              height: 31.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: 375,
            left: 34,
            child: Container(
              width: 49.w,
              height: 49.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: 311,
            right: 65,
            child: Container(
              width: 49.w,
              height: 49.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: 234,
            right: 51,
            child: Container(
              width: 31.w,
              height: 31.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: 121,
            left: 83,
            child: Container(
              width: 31.w,
              height: 31.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
