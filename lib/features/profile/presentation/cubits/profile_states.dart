import 'package:social_media/features/profile/domain/entities/profile_user.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileLoadedState extends ProfileStates {
  final ProfileUser profileUser;
  ProfileLoadedState(this.profileUser);
}

class ProfileErrorState extends ProfileStates {
  final String message;
  ProfileErrorState(this.message);
}
