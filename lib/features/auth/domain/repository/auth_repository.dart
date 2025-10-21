//Auth Operatons for this app

import 'package:social_media/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<AppUser?> loginWithEmailAndPassword(String email, String password);

  Future<AppUser> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<void> logout();

  Future<AppUser?> getCurrentUser();
}
