import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/appImages/app_images.dart';
import '../../../../core/global/widgets/textfield_widget.dart';
import 'overlapping_image.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 355.h,
        padding: EdgeInsets.symmetric(horizontal: 19,vertical: 10),
        margin: EdgeInsets.only(right: 16,left: 16,bottom: 18),
        decoration: BoxDecoration( color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10) ,
          boxShadow: [
            BoxShadow(color: Colors.grey.withValues(alpha: 0.8),blurRadius: 2)
          ]

        ),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start , children:
            [
              Row( children: [
              CircleAvatar(radius: 26,),
      SizedBox(width: 7.w,),
      Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextfieldWidget(data: "Taosif Hossain",fontsize: 15.sp,fontWeight: FontWeight.w700,),
        TextfieldWidget(data: "5h ago",fontsize: 12.sp,fontWeight: FontWeight.w600,), ], ) ],),
    SizedBox(height: 9.h,),
    TextfieldWidget( maxLines: 2, textOverflow: TextOverflow.ellipsis, fontsize: 10.sp,
    data: "This is the caption. where user write their toughts. People can like,love and commment"),
    SizedBox(height: 4.h,),
              Container(height: 186.h,width:double.infinity,decoration: BoxDecoration( color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12) ),), SizedBox(height: 4.h,),
              Padding( padding: const EdgeInsets.only(right: 10.0), child: Row( children:
              [ Expanded(child: OverlappingAvatars( images:
              [ AppImages.onb1, AppImages.onb2, AppImages.onb3, ],
                radius: 14, overlap: 14, )),
                Row( children: [ Icon(Icons.favorite_outline,size: 18,color: Colors.pink,),
                  SizedBox(width: 2.w,),
                  TextfieldWidget(data: "745",fontWeight: FontWeight.w600,) ] ),
                SizedBox(width: 20.w,), Row( children: [
                  Icon(Icons.comment_outlined,size:18),
                SizedBox(width: 4.w,),
                TextfieldWidget(data: "67",fontWeight: FontWeight.w600,) ], ) ],), ),
              SizedBox(height: 4.h,), RichText( text: TextSpan( style: TextStyle( fontSize: 10, color: Colors.black ), children: [
                const TextSpan(text: "Liked by "),
              TextSpan( text: "Blazinshado", style: const TextStyle(fontWeight: FontWeight.bold), ),
              const TextSpan(text: " and",), const TextSpan(text: " 100+", style: TextStyle(fontWeight: FontWeight.bold), ),
              const TextSpan(text: " others",), ], ), ), SizedBox(height: 4.h,),
              TextfieldWidget(data: "View all 57 comments",fontsize: 10,color: Colors.black.withValues(alpha: 0.5),) ], ), );

}
}
