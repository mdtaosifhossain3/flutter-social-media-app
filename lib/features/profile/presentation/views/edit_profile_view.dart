import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:social_media/features/profile/domain/entities/profile_user.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_states.dart';

class EditProfileView extends StatefulWidget {
  final ProfileUser profileUser;
  const EditProfileView({super.key, required this.profileUser});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final bioController = TextEditingController();

  void updateButtoHandler() {
    //Profile Cubit
    final profileCubit = context.read<ProfileCubit>();

    if (bioController.text.isNotEmpty) {
      profileCubit.updateProfile(widget.profileUser.id, bioController.text);

      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Fields Can't Be Empth")));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        //Profile Loader
        if (state is ProfileLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        //Profile Error
        if (state is ProfileErrorState) {
          return Center(child: Text(state.message));
        }

        //Edit form
        return buildEditPage();
      },
      listener: (cotext, state) {
        if (state is ProfileLoadedState) {
          return Navigator.pop(context);
        }
      },
    );
  }

  Widget buildEditPage({double uploadProgress = 0.0}) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text("Edit Profile"),
        actions: [
          IconButton(
            onPressed: () => updateButtoHandler(),
            icon: Icon(Icons.upload),
          ),
        ],
      ),
      body: Column(
        children: [
          //Profile Picture
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Edit Bio:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 6),
              AuthTextField(
                textEditingController: bioController,
                hintText: widget.profileUser.bio,
                title: "BIo",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
