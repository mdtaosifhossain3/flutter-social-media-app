import 'package:social_media/features/auth/domain/entities/app_user.dart';

abstract class AuthStatesCubit {}

class AuthInitial extends AuthStatesCubit {}

class AuthLoading extends AuthStatesCubit {}

class Authenticated extends AuthStatesCubit {
  final AppUser appUser;
  Authenticated(this.appUser);
}

class Unauthenticated extends AuthStatesCubit {}

class AuthError extends AuthStatesCubit {
  final String message;
  AuthError(this.message);
}
