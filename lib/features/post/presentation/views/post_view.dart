import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/domain/entities/app_user.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:social_media/features/bottomnav/presentation/views/bottom_nav_view.dart';
import 'package:social_media/features/post/domain/entities/post_model.dart';
import 'package:social_media/features/post/presentation/cubits/post_cubit.dart';
import 'package:social_media/features/post/presentation/cubits/post_states_cubit.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final textController = TextEditingController();
  AppUser? appUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    final user = context.read<AuthCubit>();
    appUser = user.currentUser;
  }

  void submitHandler() {
    if (textController.text.isNotEmpty) {
      final postModel = PostModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: textController.text,
        timeStamp: DateTime.now(),
        userId: appUser!.id,
        userName: appUser!.name,
        imageUrl: "",
      );
      final post = context.read<PostCubit>();
      post.createPostCubit(postModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => submitHandler(),
            icon: Icon(Icons.upload),
          ),
        ],
      ),

      body: BlocConsumer<PostCubit, PostStates>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Enter Text:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  AuthTextField(
                    textEditingController: textController,
                    hintText: "Type Text here...",
                    maxLines: 10,

                    title: "BOix",
                  ),
                ],
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is PostLoaded) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return BottomNavView();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
