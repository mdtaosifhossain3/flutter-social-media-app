import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../appImages/app_images.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final double height;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.hint = "Search...",
    this.height = 36,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).colorScheme.primary.withValues(alpha:.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            AppImages.searchIcon,
            height: 16.h,
            width: 16.w,
          ),
          SizedBox(width: 8.w),

          /// TEXT FIELD
          Expanded(
            child: TextField(
              controller: controller,
              onTap: onTap,
              onChanged: onChanged,
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.only(bottom: 2.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
