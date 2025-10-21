import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/domain/entities/app_user.dart';
import 'package:social_media/features/auth/domain/repository/auth_repository.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states_cubit.dart';

class AuthCubit extends Cubit<AuthStatesCubit> {
  final AuthRepository authRepository;
  AppUser? _appUser;

  AuthCubit(this.authRepository) : super(AuthInitial());

  // Check if user exsist.
  void checkAuth() async {
    try {
      final AppUser? user = await authRepository.getCurrentUser();

      if (user != null) {
        _appUser = user;
        emit(Authenticated(user));
      } else {
        _appUser = null;
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  //Get the current user
  AppUser? get currentUser => _appUser;

  //Login with email and password
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepository.loginWithEmailAndPassword(
        email,
        password,
      );

      if (user != null) {
        _appUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //Register with email and password
  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepository.registerWithEmailAndPassword(
        email,
        password,
        name,
      );

      _appUser = user;
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //Logout
  Future<void> logout() async {
    await authRepository.logout();
    emit(Unauthenticated());
  }
}
