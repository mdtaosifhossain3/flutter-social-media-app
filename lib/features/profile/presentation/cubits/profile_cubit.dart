import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/profile/domain/repository/profile_repository.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepository profileRepository;
  ProfileCubit({required this.profileRepository})
    : super(ProfileInitialState());
}
