import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/profile/domain/repository/profile_repository.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepository profileRepository;
  ProfileCubit({required this.profileRepository})
    : super(ProfileInitialState());

  //Fetch User
  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoadingState());
      final user = await profileRepository.fetchUserProfile(uid);

      if (user != null) {
        emit(ProfileLoadedState(user));
      } else {
        emit(ProfileErrorState("User not found"));
      }
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile(uid, String? bio) async {
    try {
      //User profile fetch
      final user = await profileRepository.fetchUserProfile(uid);
      if (user == null) {
        emit(ProfileErrorState("Failed to fetch user"));
        return;
      }
      //Update Profile picture

      //update new profile
      final updateProfile = user.copyWith(bio: bio ?? user.bio);

      //update in repo
      await profileRepository.updateUserProfile(updateProfile);
      //re fetch the profile
      await fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileErrorState("Error updating profile: ${e.toString()}"));
    }
  }
}
