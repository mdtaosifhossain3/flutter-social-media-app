import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryBoard extends StatelessWidget {
  const StoryBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:18.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 70.w,height: 100.h,
            decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),),

          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),

                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: Icon(Icons.add),
            ),
          ),

        ],
      ),
    );
  }
}
