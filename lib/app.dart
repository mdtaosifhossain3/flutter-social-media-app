import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/data/firebase_auth_repository.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states_cubit.dart';
import 'package:social_media/features/auth/presentation/views/auth_view.dart';
import 'package:social_media/features/bottomnav/presentation/views/bottom_nav_view.dart';
import 'package:social_media/themes/light_mode.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authRepo = FirebaseAuthRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo)..checkAuth(),
      child: MaterialApp(
        title: 'Social Media',
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthStatesCubit>(
          builder: (context, authState) {
            if (kDebugMode) {
              print(authState);
            }
            if (authState is Unauthenticated) {
              return AuthView();
            }
            if (authState is Authenticated) {
              return BottomNavView();
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
          listener: (context, state) {
            if (state is AuthError) {
              final snackBar = SnackBar(content: Text(state.message));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ),
    );
  }
}
