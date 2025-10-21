import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media/features/profile/domain/entities/profile_user.dart';
import 'package:social_media/features/profile/domain/repository/profile_repository.dart';

class FirebaseProfileRepository implements ProfileRepository {
  final FirebaseFirestore fireebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ProfileUser?> fetchUserProfile(String id) async {
    try {
      final userDoc = await fireebaseFirestore
          .collection("users")
          .doc(id)
          .get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          return ProfileUser(
            id: id,
            email: userData["email"],
            name: userData["name"],
            bio: userData["bio"],
            profilePictureUrl: userData["profilePictureUrl"],
          );
        }
      }

      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user profile: $e');
      }

      return null;
    }
  }

  @override
  Future<void> updateUserProfile(ProfileUser user) async {
    try {
      await fireebaseFirestore.collection("users").doc(user.id).update({
        "bio": user.bio,
        "profilePictureUrl": user.profilePictureUrl,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user profile: $e');
      }
      throw Exception('Failed to update user profile');
    }
  }
}
