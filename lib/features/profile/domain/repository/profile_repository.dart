import 'package:social_media/features/profile/domain/entities/profile_user.dart';

abstract class ProfileRepository {
  Future<ProfileUser?> fetchUserProfile(String id);
  Future<void> updateUserProfile(ProfileUser user);
}
