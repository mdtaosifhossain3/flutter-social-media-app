import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/onboard/onboard_model.dart';
import 'package:social_media/core/onboard/widgets/onboard_first.dart';
import 'package:social_media/core/onboard/widgets/onboard_three.dart';
import 'package:social_media/core/onboard/widgets/onboard_two.dart';
import 'package:social_media/features/auth/presentation/views/login_view.dart';
import 'package:social_media/features/auth/presentation/views/register_view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int _previousPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Image.asset(
              //   MyAssets.logo,
              //   width: 139.w,
              //   height: 42.h,
              //   color: MyColors.primaryColor,
              // ),
              Expanded(
                child: PageView(
                  onPageChanged: (int currentPage) {
                    _previousPage = currentPage;
                    setState(() {});
                  },
                  controller: OnboardViewModel.pageController,
                  children: const [
                    OnboardFirst(),
                    OnboardTwo(),
                    OnboardThree(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 27),
                height: 49.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return RegisterView();
                      },
                    ),
                    (Route route) => false,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              _previousPage == 2
                  ? SizedBox()
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 27),

                      height: 45.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        onPressed: () => OnboardViewModel.goToNextPage(),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 18.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3.w),

                  InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return LoginView();
                        },
                      ),
                      (Route route) => false,
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffC4c4c4),
                        //  color: MyColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }
}
