import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/appImages/app_images.dart';
import 'package:social_media/core/global/widgets/search_bar_widget.dart';
import 'package:social_media/core/global/widgets/textfield_widget.dart';
import 'package:social_media/features/auth/domain/entities/app_user.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/home/presentation/components/post_card_widget.dart';
import 'package:social_media/features/home/presentation/components/story_board.dart';
import 'package:social_media/features/post/domain/entities/post_model.dart';
import 'package:social_media/features/post/presentation/cubits/post_cubit.dart';
import 'package:social_media/features/post/presentation/cubits/post_states_cubit.dart';

import '../components/overlapping_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final allpost = context.read<PostCubit>();
  AppUser? currentUser;
  @override
  void initState() {
    fetchPosts();
    currentUser = context.read<AuthCubit>().currentUser;
    super.initState();
  }

  void fetchPosts() {
    allpost.fetchAllPost();
  }

  void deletePost(String postId) {
    allpost.deletePost(postId);
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // ---------------- HEADER (Fixed) ----------------
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SearchBarWidget(hint: "Type Search........"),
                  ),
                  SizedBox(width: 12),
                  InkWell(
                    child: Image.asset(
                      AppImages.notificationIcon,
                      width: 18,
                      height: 23,
                    ),
                  )
                ],
              ),
            ),

            // ---------------- SCROLLABLE AREA ----------------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Story section
                    SizedBox(
                      height: 95.h,
                      child: ListView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 16),
                        children: const [
                          StoryBoard(), StoryBoard(), StoryBoard(),
                          StoryBoard(), StoryBoard(),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Posts
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (_, __) => PostCardWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }


}
