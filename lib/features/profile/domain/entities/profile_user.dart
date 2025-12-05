import 'package:social_media/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String bio;
  final String profilePictureUrl;
  ProfileUser({
    required super.id,
    required super.email,
    required super.name,
    required this.bio,
    required this.profilePictureUrl,
  });

  //Method to update profile
  ProfileUser copyWith({String? bio, String? profilePictureUrl}) {
    return ProfileUser(
      id: id,
      email: email,
      name: name,
      bio: bio ?? this.bio,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      bio: json['bio'] ?? "",
      profilePictureUrl: json['profilePictureUrl'] ?? "",
    );
  }
}
