import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/global/widgets/textfield_widget.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isobsecured;
  final int? maxLines;
  final String title;
  const AuthTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.title,
    this.isobsecured = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextfieldWidget(data: title, fontsize: 14),
          SizedBox(height: 5.h),
          TextField(
            controller: textEditingController,
            obscureText: isobsecured,
            decoration: InputDecoration(
              // hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF2F2F2)),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primary),
                borderRadius: BorderRadius.circular(12),
              ),

              filled: true,
              fillColor: Color(0xffF2F2F2),
            ),
          ),
        ],
      ),
    );
  }
}
