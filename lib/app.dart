import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/features/auth/data/firebase_auth_repository.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states_cubit.dart';
import 'package:social_media/features/home/presentation/views/home_view.dart';
import 'package:social_media/features/post/data/firebase_post_repository.dart';
import 'package:social_media/features/post/presentation/cubits/post_cubit.dart';
import 'package:social_media/features/profile/data/firebase_profile_repository.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:social_media/core/splash/splash_view.dart';
import 'package:social_media/themes/light_mode.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authRepo = FirebaseAuthRepository();
  final profileRepository = FirebaseProfileRepository();
  final postRepository = FirebasePostRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(authRepo)..checkAuth(),
        ),
        BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit(profileRepository: profileRepository),
        ),
        BlocProvider<PostCubit>(
          create: (_) => PostCubit(postRepository: postRepository),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) => MaterialApp(
          title: 'Social Media',
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home: BlocConsumer<AuthCubit, AuthStatesCubit>(
            builder: (context, authState) {
              if (kDebugMode) {
                print(authState);
              }
              if (authState is Unauthenticated) {
                return SplashView();
              }
              if (authState is Authenticated) {
                return HomeView();
              } else {
                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
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
      ),
    );
  }
}
